<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreAddressBookRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
{
    $slug = $this->route('slug'); // NOT 'address_book'

    return [
        'first_name' => 'required|string|max:255',
        'last_name'  => 'required|string|max:255',
        'email'      => 'required|email|unique:address_books,email,' . $slug . ',slug',
        'phone'      => 'required|digits:10',
        'street'     => 'required|string|max:255',
        'zip_code'   => 'required|string|max:20',
        'city_id'    => 'required|exists:cities,id',
        'profile_pic' => [
            $this->isMethod('post') ? 'required' : 'nullable',
            'image',
            'mimes:jpg,jpeg,png,gif,webp,svg',
            'max:300',
            'dimensions:width=150,height=150',
        ],
    ];
}

}
