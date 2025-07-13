<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AddressBookController;
use Illuminate\Support\Facades\Auth;

// Route::get('/', function () {
//     return view('welcome');
// });

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get('/', function () {
    return redirect()->route('addressbook.index');
    
});

Route::prefix('addressbook')->name('addressbook.')->group(function () {
    Route::get('/', [AddressBookController::class, 'index'])->name('index');
    Route::get('/create', [AddressBookController::class, 'create'])->name('create');
    Route::post('/', [AddressBookController::class, 'store'])->name('store');
    Route::get('/edit/{slug}', [AddressBookController::class, 'edit'])->name('edit');
    Route::put('/{slug}', [AddressBookController::class, 'update'])->name('update');
    Route::delete('/{slug}', [AddressBookController::class, 'destroy'])->name('destroy');
    Route::get('/export/csv', [AddressBookController::class, 'exportCSV'])->name('export.csv');
    Route::get('/export/xml', [AddressBookController::class, 'exportXML'])->name('export.xml');
});

Route::post('/check-email', [AddressBookController::class, 'checkEmail']);
Route::get('/addressbook/export/csv', [AddressBookController::class, 'exportCSV'])->name('addressbook.export.csv');
Route::get('/addressbook/export/xml', [AddressBookController::class, 'exportXML'])->name('addressbook.export.xml');
