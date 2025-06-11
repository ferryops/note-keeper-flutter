# Note Keeper App

## Deskripsi Aplikasi

**Note Keeper** adalah aplikasi pencatat sederhana berbasis **Flutter** yang memungkinkan pengguna untuk menulis, menyimpan, dan menghapus catatan. Aplikasi ini mendukung mode gelap/terang, menyimpan catatan secara lokal menggunakan **SQLite**, dan menyimpan preferensi tema dengan **SharedPreferences**.

## Teknologi yang Digunakan

- **Flutter SDK**
- **SQLite** (via `sqflite`)
- **Shared Preferences**
- **Provider** (untuk state management)
- **Android Emulator (AVD)** untuk pengujian

## Fitur Aplikasi

| Fitur                  | Deskripsi                                                    |
| ---------------------- | ------------------------------------------------------------ |
| Tambah Catatan         | Pengguna dapat membuat catatan baru                          |
| Lihat Daftar Catatan   | Semua catatan ditampilkan di halaman utama                   |
| Hapus Catatan          | Swipe ke kiri/kanan untuk menghapus                          |
| Navigasi Antar Halaman | Halaman utama dan halaman tambah catatan                     |
| Gestures Support       | Swipe to delete menggunakan `Dismissible`                    |
| Theme Dark/Light       | Toggle tema dan simpan preferensi dengan `SharedPreferences` |
| SQLite Database        | Menyimpan catatan secara lokal                               |

## Struktur Direktori

```
lib/
├── db/
│ └── note_database.dart # Mengelola koneksi dan operasi SQLite
├── models/
│ └── note.dart # Model data untuk catatan
├── providers/
│ └── theme_provider.dart # Mengelola tema dark/light menggunakan Provider
├── screens/
│ ├── add_note_screen.dart # Layar untuk menambahkan catatan
│ └── home_screen.dart # Layar utama yang menampilkan daftar catatan
├── widgets/
│ └── note_card.dart # Widget untuk menampilkan catatan dalam bentuk kartu
└── main.dart # Titik masuk utama aplikasi Flutter
```

## Cara Menjalankan Aplikasi

### 1. Persiapan

- Install **Flutter SDK**
- Install **Android Studio** & buat **Emulator (AVD)**
- Clone project dari repository:

```bash
git clone https://github.com/ferryops/note-keeper-flutter.git
```

````

### 2. Instalasi Dependencies

```bash
flutter pub get
```

### 3. Jalankan Emulator Android

```bash
flutter emulators --launch <emulator_id>
```

Contoh:

```bash
flutter emulators --launch Medium_Phone_API_36
```

### 4. Jalankan Aplikasi

```bash
flutter run
```

````
