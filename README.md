# 📘 Laravel Address Book

A mini address book web application built with Laravel. It supports user-friendly CRUD operations, profile image upload, email validation (real-time & backend), Redis/Memcached caching, MySQL indexing, activity logging, and data export (CSV, XML).

---

## 📦 Features

- ✅ Create, Update, Delete entries using **slug** (not ID)
- 🖼️ Profile picture upload with server & client-side validation (150x150px, max 300KB)
- 📧 Real-time and backend **email uniqueness** validation
- 💌 Immediate email after entry created (using Mail)
- ⏱️ Queued **promotional email** sent after 1 hour
- 🔎 Filter listing by City & Zip Code
- 🚀 Redis/Memcached caching for fast performance
- 📤 Export Address Book to **CSV and XML**
- 🛡️ Strict validation using **FormRequest**
- 🧾 **Activity Logs** for Insert, Update, Delete operations
- 🌆 City dropdown populated from `cities` DB table
