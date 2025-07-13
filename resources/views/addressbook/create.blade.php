@extends('layouts.app')

@section('content')

@if ($errors->any())
    <div class="alert alert-danger">
        <ul class="mb-0">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
<div class="container">
    <h2>Add Address Book Entry</h2>
    <form action="{{ route('addressbook.store') }}" method="POST" enctype="multipart/form-data" id="address-form">
        @csrf
        @include('addressbook.form')
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
@endsection
