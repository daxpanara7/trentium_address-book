@extends('layouts.app')

@section('content')
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Address Book</h2>
        <a href="{{ route('addressbook.create') }}" class="btn btn-primary">+ Add New</a>
    </div>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <form method="GET" class="row g-3 mb-4">
        <div class="col-md-4">
            <select name="city_id" class="form-control">
                <option value="">All Cities</option>
                @foreach($cities as $city)
                    <option value="{{ $city->id }}" {{ request('city_id') == $city->id ? 'selected' : '' }}>
                        {{ $city->name }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="col-md-4">
            <input type="text" name="zip_code" placeholder="Zip Code" value="{{ request('zip_code') }}" class="form-control">
        </div>
        <div class="col-md-4 d-flex gap-2">
            <button type="submit" class="btn btn-success">Filter</button>
            <a href="{{ route('addressbook.index') }}" class="btn btn-secondary">Reset</a>
        </div>
    </form>

    <div class="mb-3 d-flex gap-2">
        <a href="{{ route('addressbook.export.csv') }}" class="btn btn-outline-primary btn-sm">Export CSV</a>
        <a href="{{ route('addressbook.export.xml') }}" class="btn btn-outline-success btn-sm">Export XML</a>
    </div>

    <table class="table table-striped table-bordered">
        <thead class="table-dark">
            <tr>
                <th>Pic</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>City</th>
                <th>Zip</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($addressBooks as $entry)
                <tr>
                    <td>
                    @if ($entry->profile_pic && file_exists(public_path('uploads/profiles/' . $entry->profile_pic)))
                        <img src="{{ asset('uploads/profiles/' . $entry->profile_pic) }}" alt="Profile" width="75">
                    @else
                        <span>No Image</span>
                    @endif
                    </td>
                    <td>{{ $entry->first_name }} {{ $entry->last_name }}</td>
                    <td>{{ $entry->email }}</td>
                    <td>{{ $entry->phone }}</td>
                    <td>{{ $entry->city->name ?? '' }}</td>
                    <td>{{ $entry->zip_code }}</td>
                    <td class="d-flex gap-2">
                        <a href="{{ route('addressbook.edit', $entry->slug) }}" class="btn btn-sm btn-warning">Edit</a>
                        <form action="{{ route('addressbook.destroy', $entry->slug) }}" method="POST" onsubmit="return confirm('Delete this record?')">
                            @csrf @method('DELETE')
                            <button class="btn btn-sm btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr><td colspan="7" class="text-center">No records found.</td></tr>
            @endforelse
        </tbody>
    </table>
@endsection

