<div class="mb-3">
    <label>First Name</label>
    <input type="text" name="first_name" value="{{ old('first_name', $entry->first_name ?? '') }}" class="form-control" required>
</div>

<div class="mb-3">
    <label>Last Name</label>
    <input type="text" name="last_name" value="{{ old('last_name', $entry->last_name ?? '') }}" class="form-control" required>
</div>

<div class="mb-3">
    <label>Email</label>
    <input type="email" name="email" id="email" value="{{ old('email', $entry->email ?? '') }}" class="form-control" required>
    <small id="emailFeedback" class="text-danger"></small>
</div>

<div class="mb-3">
    <label>Phone</label>
    <input type="text" name="phone" value="{{ old('phone', $entry->phone ?? '') }}" class="form-control" maxlength="10" pattern="[0-9]{10}" required>
</div>

<div class="mb-3">
    <label>Street</label>
    <input type="text" name="street" value="{{ old('street', $entry->street ?? '') }}" class="form-control" required>
</div>

<div class="mb-3">
    <label>Zip Code</label>
    <input type="text" name="zip_code" value="{{ old('zip_code', $entry->zip_code ?? '') }}" class="form-control" required>
</div>

<div class="mb-3">
    <label>City</label>
    <select name="city_id" class="form-control" required>
        <option value="">Select</option>
        @foreach($cities as $city)
            <option value="{{ $city->id }}" {{ (old('city_id', $entry->city_id ?? '') == $city->id) ? 'selected' : '' }}>{{ $city->name }}</option>
        @endforeach
    </select>
</div>

<div class="mb-3">
    <label>Profile Picture</label>
    <input type="file" name="profile_pic" accept="image/png,image/jpeg,image/jpg,image/webp,image/gif,image/svg+xml" class="form-control" {{ isset($entry) ? '' : 'required' }}>
</div>

@if(isset($entry))
    <div class="mb-3">
         <img src="{{ asset('uploads/profiles/' . $entry->profile_pic) }}" alt="Profile" width="100" class="mb-2">
    </div>
@endif

<script>
    document.getElementById('email').addEventListener('blur', function () {
        const email = this.value;
        fetch('{{ url('/check-email') }}', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({email})
        }).then(res => res.json())
        .then(data => {
            const feedback = document.getElementById('emailFeedback');
            feedback.textContent = data.available ? '' : 'Email is already taken.';
        });
    });
</script>
