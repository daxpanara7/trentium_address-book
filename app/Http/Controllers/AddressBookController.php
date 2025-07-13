<?php

namespace App\Http\Controllers;

use App\Models\AddressBook;
use App\Models\City;
use App\Models\ActivityLog;
use Illuminate\Http\Request;
use App\Http\Requests\StoreAddressBookRequest;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use App\Mail\AddressBookCreated;
use Illuminate\Support\Facades\Log;
use App\Mail\PromotionalEmail;

class AddressBookController extends Controller
{
    public function index(Request $request)
    {
        $filterCity = $request->get('city_id');
        $filterZip = $request->get('zip_code');

        $cacheKey = 'address_books_' . $filterCity . '_' . $filterZip;

        $addressBooks = Cache::remember($cacheKey, 60, function () use ($filterCity, $filterZip) {

            $query = AddressBook::with('city');
            if ($filterCity) {
                $query->where('city_id', $filterCity);
            }
            if ($filterZip) {
                $query->where('zip_code', $filterZip);
            }
            return $query->latest()->get();
        });

        $cities = City::all();

        return view('addressbook.index', compact('addressBooks', 'cities'));
    }

    public function create()
    {
        $cities = City::all();
        return view('addressbook.create', compact('cities'));
    }

    public function store(StoreAddressBookRequest $request)
    {
        $slug = Str::uuid();
        $imageName = null;

        if ($request->hasFile('profile_pic')) {
            $image = $request->file('profile_pic');

            // Ensure directory exists
            $destinationPath = public_path('uploads/profiles');
            if (!file_exists($destinationPath)) {
                mkdir($destinationPath, 0755, true);
            }

            $imageName = uniqid('profile_', true) . '.' . $image->getClientOriginalExtension();
            $image->move($destinationPath, $imageName);

            Log::info("Image stored at: uploads/profiles/" . $imageName);
        }

        $address = AddressBook::create([
            'slug' => $slug,
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'profile_pic' => $imageName,
            'email' => $request->email,
            'phone' => $request->phone,
            'street' => $request->street,
            'zip_code' => $request->zip_code,
            'city_id' => $request->city_id,
        ]);

        $this->clearAddressBookCache();
        $this->logActivity($slug, 'insert', $address);

        Mail::to($request->email)->send(new AddressBookCreated($address));
        Mail::to($request->email)->later(now()->addHour(), new PromotionalEmail($address));

        return redirect()->route('addressbook.index')->with('success', 'Address book entry created.');
    }


    public function edit($slug)
    {
        $entry = AddressBook::where('slug', $slug)->firstOrFail();
        $cities = City::all();
        return view('addressbook.edit', compact('entry', 'cities'));
    }

    public function update(StoreAddressBookRequest $request, $slug)
    {
        $entry = AddressBook::where('slug', $slug)->firstOrFail();
        $hasChanges = false;

        if ($request->hasFile('profile_pic')) {
            $destinationPath = public_path('uploads/profiles');

            if (!file_exists($destinationPath)) {
                mkdir($destinationPath, 0755, true);
            }

            if ($entry->profile_pic && file_exists($destinationPath . '/' . $entry->profile_pic)) {
                unlink($destinationPath . '/' . $entry->profile_pic);
            }

            $image = $request->file('profile_pic');
            $imageName = uniqid('profile_', true) . '.' . $image->getClientOriginalExtension();
            $image->move($destinationPath, $imageName);

            $entry->profile_pic = $imageName;
            $hasChanges = true;
            Log::info("Updated image stored at: uploads/profiles/" . $imageName);
        }

        $fieldsToUpdate = ['first_name','last_name','email','phone','street','zip_code','city_id'];

        foreach ($fieldsToUpdate as $field) {
            if ($request->input($field) !== $entry->$field) {
                $entry->$field = $request->input($field);
                $hasChanges = true;
            }
        }

        if ($hasChanges) {
            $entry->save();
            $this->clearAddressBookCache();
            $this->logActivity($slug, 'update', $entry->getChanges());
            return redirect()->route('addressbook.index')->with('success', 'Address book entry updated.');
        } else {
            return redirect()->route('addressbook.index')->with('success', 'No changes to update.');
        }
    }

    public function destroy($slug)
    {
        $entry = AddressBook::findOrFail($slug);
        $entry->delete();
        $this->clearAddressBookCache();

       $this->logActivity($slug, 'delete', $entry);

        return redirect()->route('addressbook.index')->with('success', 'Address book entry deleted.');
    }

    public function checkEmail(Request $request)
    {
        $exists = AddressBook::where('email', $request->email)->exists();
        return response()->json(['available' => !$exists]);
    }

    public function exportCSV()
    {
        $fileName = 'address_book.csv';
        $addressBooks = AddressBook::with('city')->get();

        $headers = [
            'Content-type' => 'text/csv',
            'Content-Disposition' => 'attachment; filename=' . $fileName,
        ];

        $callback = function () use ($addressBooks) {
            $file = fopen('php://output', 'w');
            fputcsv($file, ['First Name', 'Last Name', 'Email', 'Phone', 'City', 'Zip Code']);
            foreach ($addressBooks as $book) {
                fputcsv($file, [
                    $book->first_name,
                    $book->last_name,
                    $book->email,
                    $book->phone,
                    $book->city->name ?? '',
                    $book->zip_code
                ]);
            }
            fclose($file);
        };

        return response()->stream($callback, 200, $headers);
    }

    public function exportXML()
    {
        $addressBooks = AddressBook::with('city')->get();

        $xml = new \SimpleXMLElement('<?xml version="1.0"?><addressBooks></addressBooks>');

        foreach ($addressBooks as $book) {
            $entry = $xml->addChild('entry');
            $entry->addChild('first_name', $book->first_name);
            $entry->addChild('last_name', $book->last_name);
            $entry->addChild('email', $book->email);
            $entry->addChild('phone', $book->phone);
            $entry->addChild('city', $book->city->name ?? '');
            $entry->addChild('zip_code', $book->zip_code);
        }

        return response($xml->asXML(), 200)
            ->header('Content-Type', 'application/xml');
    }

    private function clearAddressBookCache()
    {
        if (Cache::getStore() instanceof \Illuminate\Cache\RedisStore) {
            foreach (Cache::getRedis()->keys('address_books_*') as $key) {
                Cache::forget(str_replace(config('cache.prefix') . ':', '', $key));
            }
        } else {
            Cache::flush(); 
        }
    }


    private function logActivity($slug, $action, $data)
    {   
        Log::info("Logging activity: $action for $slug");
        ActivityLog::create([
            'slug' => $slug,
            'action' => $action,
            'data' => json_encode($data),
        ]);
    }

}
