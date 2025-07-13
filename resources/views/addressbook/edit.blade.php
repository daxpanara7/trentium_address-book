@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Edit Address Book Entry</h2>
    <form action="{{ route('addressbook.update', $entry->slug) }}" method="POST" enctype="multipart/form-data" id="address-form">
        @csrf @method('PUT')
        @include('addressbook.form', ['entry' => $entry])
        <button type="submit" class="btn btn-primary">Update</button>
        <a href="{{ route('addressbook.index') }}" class="btn btn-secondary">Cancel</a>
    </form>
</div>
@endsection
