<!DOCTYPE html>
<html>
<head>
    <title>Address Book</title>
    <meta charset="UTF-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Optional JS -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4">
        <a class="navbar-brand" href="{{ route('addressbook.index') }}">Address Book</a>
    </nav>

    <main class="py-4">
        @yield('content')
    </main>
</body>
</html>
