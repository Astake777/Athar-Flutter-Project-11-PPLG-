# Dokumentasi Belajar — fluttertest1

Isi:
1. Konsep dasar Flutter yang dipakai di kedua file
2. `kalkulator_page.dart` — baris per baris
3. `login_clone.dart` — baris per baris
4. Kemungkinan pertanyaan guru & jawabannya

---

## 1. Konsep dasar yang dipakai

### Widget
Semua yang tampil di layar Flutter adalah **widget**: teks, tombol, kotak, jarak kosong, bahkan halaman itu sendiri. Widget disusun bertingkat (pohon/tree): widget besar berisi widget kecil.

### StatelessWidget vs StatefulWidget
| | StatelessWidget | StatefulWidget |
|---|---|---|
| Data bisa berubah? | Tidak | Ya |
| Contoh | `MyApp` di `main.dart` | `KalkulatorPage`, `LoginClone` |
| Punya `setState`? | Tidak | Ya |

`StatefulWidget` selalu berpasangan dengan class `State`:
```dart
class KalkulatorPage extends StatefulWidget {          // "kulit"-nya
  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}
class _KalkulatorPageState extends State<KalkulatorPage> {  // "otak"-nya: variabel + build
  ...
}
```
Variabel yang bisa berubah disimpan di class `State`. Kalau nilainya diubah **tanpa** `setState`, layar tidak ikut berubah.

### setState
```dart
setState(() {
  _hasil = "...";
});
```
Artinya: "ubah data ini, lalu panggil `build()` lagi supaya tampilan ikut baru".

### build(BuildContext context)
Fungsi yang **menggambar** tampilan. Dipanggil pertama kali saat widget muncul, dan dipanggil ulang setiap `setState`.

### const
`const Text("Login")` = widget ini nilainya tetap, Flutter tidak perlu membuat ulang setiap `build`. Ini optimasi. Kalau ada bagian yang tergantung variabel (misal `$_hasil`), tidak bisa `const`.

### Awalan `_` (underscore)
`_hasil`, `_hitung`, `_tabButton` → **private**, hanya bisa diakses di dalam file itu. Konvensi Dart.

### Widget layout yang sering muncul
| Widget | Fungsi |
|---|---|
| `Scaffold` | kerangka halaman: menyediakan `appBar`, `body`, `backgroundColor` |
| `AppBar` | bar judul di atas |
| `Column` | menyusun anak **ke bawah** (vertikal) |
| `Row` | menyusun anak **ke samping** (horizontal) |
| `Container` | kotak serbaguna: bisa diberi margin, padding, warna, border |
| `SizedBox` | kotak kosong berukuran tetap → dipakai sebagai **jarak** |
| `Center` | menaruh anak di tengah |
| `Expanded` | membuat anak mengisi sisa ruang (di Row/Column) |
| `Padding`/`EdgeInsets` | ruang di dalam/luar widget |

---

## 2. kalkulator_page.dart — baris per baris

```dart
import 'package:flutter/material.dart';
```
Mengambil semua widget Material Design (Scaffold, AppBar, TextField, ElevatedButton, dll). Wajib ada di setiap file UI Flutter.

```dart
import 'package:flutter/services.dart';
```
Berisi `FilteringTextInputFormatter`. Tanpa import ini, `digitsOnly` tidak dikenali (error merah).

```dart
class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});
```
- `extends StatefulWidget` → halaman ini punya data yang berubah (hasil).
- `const KalkulatorPage({super.key})` → constructor. `key` dipakai Flutter untuk mengenali widget; `super.key` meneruskannya ke parent. Standar bawaan, tidak perlu diubah.

```dart
  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}
```
- `@override` → menimpa fungsi bawaan `StatefulWidget`.
- `createState()` → membuat objek State pasangannya.
- `=>` → arrow function, sama dengan `{ return _KalkulatorPageState(); }`.

```dart
class _KalkulatorPageState extends State<KalkulatorPage> {
  final TextEditingController _a1 = TextEditingController();
  final TextEditingController _a2 = TextEditingController();
```
- `TextEditingController` = objek yang "memegang" isi sebuah TextField. Tanpa ini kita tidak bisa membaca apa yang diketik user.
- `final` → variabelnya tidak bisa diganti objek lain (tapi isinya tetap bisa berubah).
- Ada dua karena ada dua TextField.

```dart
  String _hasil = "";
```
Menyimpan teks hasil. Awalnya kosong. Tidak `final` karena nilainya diganti setiap kali hitung.

```dart
  void _hitung(String operator) {
```
- `void` → fungsi tidak mengembalikan nilai.
- Parameter `operator` bertipe `String`: `"+"`, `"-"`, `"x"`, atau `"/"`.

```dart
    final double a1 = double.tryParse(_a1.text) ?? 0;
    final double a2 = double.tryParse(_a2.text) ?? 0;
```
- `_a1.text` → isi TextField (tipe `String`, misal `"12"`).
- `double.tryParse("12")` → `12.0`. Kalau gagal (teks kosong/bukan angka) → `null`, **tidak crash** (beda dengan `double.parse` yang langsung error).
- `?? 0` → operator *null-coalescing*: "kalau kiri `null`, pakai `0`".
- Dipakai `double` bukan `int` supaya pembagian bisa menghasilkan desimal (7/2 = 3.5).

```dart
    double hasil = 0;
    if (operator == "+") hasil = a1 + a2;
    if (operator == "-") hasil = a1 - a2;
    if (operator == "x") hasil = a1 * a2;
    if (operator == "/") hasil = a1 / a2;
```
Empat `if` sederhana. Hanya satu yang cocok karena `operator` cuma satu nilai. Bisa juga ditulis dengan `switch`, hasilnya sama.

```dart
    setState(() {
      _hasil = "$a1 $operator $a2 = $hasil";
    });
  }
```
- `"$a1 $operator $a2 = $hasil"` → **string interpolation**: menyisipkan nilai variabel ke teks. Contoh: `"12.0 + 3.0 = 15.0"`.
- Dibungkus `setState` supaya `Text` di bawah ikut berubah.

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Calculator"),
      ),
```
- `build` mengembalikan `Widget` (pohon tampilan).
- `Scaffold` = kerangka halaman. `appBar` = bar biru/ungu di atas dengan judul.

```dart
      body: Column(
        children: [
```
Isi halaman disusun vertikal (atas ke bawah). `children` = daftar widget anak.

```dart
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              controller: _a1,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(hintText: "A1"),
            ),
          ),
```
- `Container` + `margin: EdgeInsets.all(10)` → jarak 10 px di semua sisi (mengikuti pola `login_page.dart`).
- `controller: _a1` → hubungkan field ini ke `_a1` supaya isinya bisa dibaca.
- `keyboardType: TextInputType.number` → di HP, keyboard yang muncul adalah keyboard angka. **Tapi** ini hanya saran ke sistem; user masih bisa paste huruf.
- `inputFormatters: [FilteringTextInputFormatter.digitsOnly]` → ini yang benar-benar **menolak** selain 0-9. Jadi keduanya dipakai bersama: yang satu untuk kenyamanan, yang satu untuk paksaan.
- `hintText: "A1"` → teks abu-abu saat field kosong (placeholder).

Blok TextField kedua identik, hanya `_a2` dan `"A2"`.

```dart
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _hitung("+"),
                child: const Text("+"),
              ),
              const SizedBox(width: 10),
              ...
```
- `Row` → tombol berjajar ke samping.
- `mainAxisAlignment: center` → tombol dikumpulkan di tengah (sumbu utama Row = horizontal).
- `onPressed: () => _hitung("+")` → **fungsi anonim** yang dijalankan saat tombol ditekan; isinya memanggil `_hitung` dengan `"+"`. Kalau ditulis `onPressed: _hitung("+")` (tanpa `() =>`) itu **salah**: fungsi langsung dijalankan saat build, bukan saat ditekan.
- `SizedBox(width: 10)` → jarak 10 px antar tombol.

```dart
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              "Hasil: $_hasil",
              style: const TextStyle(fontSize: 20),
            ),
          ),
```
Menampilkan hasil. `Text` ini **tidak** `const` karena isinya tergantung `_hasil`. `TextStyle`-nya boleh `const` karena tetap.

### Alur data lengkap
1. User mengetik `12` di A1 → tersimpan di `_a1.text`.
2. User mengetik `3` di A2 → tersimpan di `_a2.text`.
3. User menekan `+` → `onPressed` jalan → `_hitung("+")`.
4. `_hitung` baca `_a1.text` & `_a2.text`, ubah ke `12.0` dan `3.0`.
5. `if (operator == "+")` cocok → `hasil = 15.0`.
6. `setState` set `_hasil = "12.0 + 3.0 = 15.0"` → `build` dipanggil ulang.
7. `Text("Hasil: $_hasil")` menampilkan teks baru.

---

## 3. login_clone.dart — baris per baris

```dart
class LoginClone extends StatefulWidget { ... }
class _LoginCloneState extends State<LoginClone> {
```
Pola sama dengan kalkulator. `Stateful` karena ada dua hal yang berubah: tab dan mata password.

```dart
  int _tab = 0;
  bool _sembunyikanPassword = true;
```
- `_tab` → tab yang dipilih. `0` = Guru, `1` = Murid. Dipakai angka (bukan String) supaya mudah dibandingkan dengan `index` tombol.
- `_sembunyikanPassword` → `true` = password tampil `●●●●`. Default `true` seperti aplikasi asli.

```dart
  @override
  Widget build(BuildContext context) {
    const biru = Color(0xFF2F80ED);
```
- Warna disimpan di variabel supaya tidak ditulis berulang.
- `0xFF2F80ED` → format ARGB hex: `FF` = alpha (100% tidak transparan), `2F80ED` = kode warna biru (#2F80ED). Diambil dari warna tombol di screenshot asli.

```dart
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
```
- Tidak ada `appBar` karena aplikasi aslinya polos.
- `SafeArea` → mendorong isi supaya tidak tertutup notch / status bar / jam di atas.

```dart
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
```
- `SingleChildScrollView` → halaman bisa **discroll**. Penting: saat keyboard muncul, layar jadi pendek; tanpa ini Flutter error "bottom overflowed by N pixels" (garis kuning-hitam).
- `symmetric(horizontal: 24)` → jarak 24 px kiri-kanan saja, atas-bawah 0.

```dart
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
```
- `crossAxisAlignment: start` → anak-anak rata **kiri**. Di `Column`, sumbu utama (main) = vertikal, sumbu silang (cross) = horizontal. Dibutuhkan supaya label "NIY" dan "Password" nempel kiri seperti asli.

```dart
              const SizedBox(height: 100),
```
Ruang kosong 100 px dari atas supaya logo turun ke posisi seperti screenshot.

```dart
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  height: 180,
                  errorBuilder: (_, _, _) => const Icon(Icons.school, size: 180, color: Color(0xFF2F80ED)),
                ),
              ),
```
- `Center` → karena Column rata kiri, logo perlu dibungkus `Center` supaya tetap di tengah.
- `Image.asset("assets/logo.png")` → memuat gambar dari folder project. Path harus **persis sama** dengan yang didaftarkan di `pubspec.yaml`.
- `height: 180` → lebar menyesuaikan otomatis (proporsi terjaga).
- `errorBuilder` → kalau file tidak ada, tampilkan ikon pengganti alih-alih crash. `(_, _, _)` = tiga parameter yang tidak dipakai (context, error, stackTrace), ditulis `_` supaya tidak ada warning "unused variable".

```dart
              const SizedBox(height: 24),
              const Center(
                child: Text("Selamat Datang", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
              ),
```
- `FontWeight.w600` = semi-bold. Skala: w400 normal, w500 medium, w600 semi-bold, w700 bold. Aslinya terlihat tebal tapi tidak setebal `bold`, jadi dipilih w600.

```dart
              const Center(
                child: Text("Masukkan niy dan password untuk mengakses",
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              ),
```
Subjudul abu-abu, lebih kecil.

### Toggle Guru / Murid
```dart
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    _tabButton("Guru", 0),
                    _tabButton("Murid", 1),
                  ],
                ),
              ),
```
- `Container` abu-abu muda (`#F1F1F1`) dengan sudut membulat 12 → "wadah" toggle.
- `padding: 6` → jarak antara wadah dan tab putih di dalamnya (terlihat seperti frame).
- **Catatan:** kalau `Container` punya `decoration`, `color` harus ditaruh **di dalam** `BoxDecoration`, bukan di `Container` langsung — kalau tidak, error.
- `_tabButton(...)` → fungsi buatan sendiri (lihat bawah), dipanggil dua kali.

```dart
  Widget _tabButton(String label, int index) {
    final aktif = _tab == index;
```
- Fungsi mengembalikan `Widget`. Ini cara memecah UI supaya tidak duplikat.
- `aktif` bernilai `true` kalau tab ini yang sedang dipilih.

```dart
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _tab = index),
```
- `Expanded` → di dalam `Row`, dua tombol berbagi lebar **sama rata** (50%:50%). Tanpa `Expanded`, lebarnya cuma selebar teks.
- `GestureDetector` → membuat widget biasa (Container) bisa merespons sentuhan. `onTap` → saat disentuh, ganti `_tab` lalu render ulang.

```dart
        child: Container(
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: aktif ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(label, style: TextStyle(
            fontSize: 16,
            fontWeight: aktif ? FontWeight.w600 : FontWeight.normal,
            color: aktif ? Colors.black : Colors.grey,
          )),
```
- `aktif ? A : B` → **ternary operator**: kalau `aktif` true pakai A, kalau false pakai B.
- Tab aktif: putih, teks hitam tebal. Tab tidak aktif: transparan (jadi terlihat abu wadahnya), teks abu biasa.
- Radius 10 sedikit lebih kecil dari wadah (12) supaya sudutnya terlihat pas.

### Label + TextField
```dart
              const Text("NIY", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(
                decoration: _inputDecoration(hint: "Masukkan NIY", icon: Icons.email),
              ),
```
Label tebal di atas, jarak 8, lalu field. Dekorasinya dari fungsi `_inputDecoration`.

```dart
  InputDecoration _inputDecoration({required String hint, required IconData icon}) {
```
- `{required ...}` → **named parameter** wajib. Saat dipanggil harus tulis `hint: ...`, `icon: ...`. Lebih jelas dibanding urutan posisi.

```dart
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
    );
```
Border kotak abu tipis, sudut 12. Disimpan di variabel karena dipakai dua kali.

```dart
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: Icon(icon, color: const Color(0xFF2F80ED)),
      contentPadding: const EdgeInsets.symmetric(vertical: 22),
      enabledBorder: border,
      focusedBorder: border.copyWith(borderSide: const BorderSide(color: Color(0xFF2F80ED))),
    );
  }
```
- `prefixIcon` → ikon di sisi kiri dalam field (amplop / perisai), warna biru.
- `contentPadding: vertical 22` → field jadi lebih tinggi/gemuk seperti aslinya.
- `enabledBorder` → border saat field diam. `focusedBorder` → border saat field diketik (jadi biru).
- `.copyWith(...)` → salin objek lalu ubah sebagian propertinya saja.

### TextField Password
```dart
              TextField(
                obscureText: _sembunyikanPassword,
                decoration: _inputDecoration(hint: "Masukkan password", icon: Icons.shield).copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _sembunyikanPassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => _sembunyikanPassword = !_sembunyikanPassword);
                    },
                  ),
                ),
              ),
```
- `obscureText: true` → teks jadi `●●●●`.
- `suffixIcon` → ikon di sisi kanan. Dipakai `IconButton` (bukan `Icon`) supaya bisa ditekan.
- Ikon berubah: `visibility_off` (mata dicoret) saat disembunyikan, `visibility` (mata) saat ditampilkan.
- `!_sembunyikanPassword` → operator NOT, membalik `true`↔`false`. Setiap ditekan nilainya toggle.

### Tombol Masuk
```dart
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: biru,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Masuk", style: TextStyle(fontSize: 16)),
                ),
              ),
```
- `SizedBox(width: double.infinity)` → tombol selebar layar (dikurangi padding 24 kiri-kanan). `ElevatedButton` sendiri tidak punya properti lebar, jadi dibungkus `SizedBox`.
- `onPressed: () {}` → fungsi kosong. Harus tetap ada; kalau `onPressed: null` tombol jadi **disabled** (abu-abu).
- `styleFrom` → cara singkat mengatur gaya. `backgroundColor` = warna tombol, `foregroundColor` = warna teks/ikon.
- `elevation: 0` → tanpa bayangan (aslinya flat).
- `shape: RoundedRectangleBorder(radius 12)` → sudut membulat.

---

## 4. Kemungkinan pertanyaan guru & jawaban

**Q: Kenapa pakai StatefulWidget, bukan StatelessWidget?**
Karena ada data yang berubah saat aplikasi jalan (hasil hitung, tab yang dipilih, mata password). StatelessWidget tidak bisa berubah setelah dibuat.

**Q: Apa fungsi setState?**
Memberi tahu Flutter bahwa data berubah dan `build()` harus dipanggil ulang supaya tampilan ikut berubah. Kalau ubah variabel tanpa setState, nilainya berubah tapi layar tidak.

**Q: Apa itu TextEditingController?**
Objek yang terhubung ke TextField dan menyimpan isinya. Dipakai untuk membaca teks (`_a1.text`) dari kode.

**Q: Kenapa pakai double.tryParse bukan double.parse?**
`parse` langsung error kalau teksnya bukan angka (misal kosong). `tryParse` mengembalikan `null`, lalu `?? 0` mengubahnya jadi 0. Jadi aplikasi tidak crash kalau user langsung tekan tombol tanpa mengisi.

**Q: Apa arti `?? 0`?**
Operator null-coalescing: "kalau nilai di kiri null, gunakan nilai di kanan".

**Q: Kenapa double, bukan int?**
Supaya pembagian bisa menghasilkan desimal, misal 7 / 2 = 3.5. Kalau int, hasilnya dibulatkan.

**Q: Bedanya keyboardType number dengan digitsOnly?**
`keyboardType` hanya menentukan keyboard mana yang muncul di HP (bisa dilewati dengan paste). `digitsOnly` benar-benar menolak karakter selain 0-9. Keduanya dipakai bersama.

**Q: Kenapa onPressed ditulis `() => _hitung("+")` bukan `_hitung("+")`?**
`onPressed` butuh **fungsi**, bukan hasil fungsi. `() => _hitung("+")` adalah fungsi yang baru dijalankan saat ditekan. Kalau `_hitung("+")` saja, dia langsung dijalankan saat build.

**Q: Apa bedanya Column dan Row?**
Column menyusun anak ke bawah (vertikal), Row ke samping (horizontal).

**Q: Apa itu mainAxisAlignment dan crossAxisAlignment?**
Main axis = arah utama widget (Column → vertikal, Row → horizontal). Cross axis = arah tegak lurusnya. `mainAxisAlignment.center` di Row = tombol berkumpul di tengah secara horizontal. `crossAxisAlignment.start` di Column = anak rata kiri.

**Q: Kenapa pakai SizedBox untuk jarak, bukan margin?**
Keduanya bisa. `SizedBox` lebih sederhana untuk jarak antar widget di Column/Row. `margin` dipakai di Container yang sudah ada.

**Q: Apa fungsi `_` di depan nama variabel/fungsi?**
Membuatnya private — hanya bisa diakses di file itu. Konvensi Dart.

**Q: Apa itu `const` di depan widget?**
Menandai widget yang nilainya tetap, sehingga Flutter tidak membuat ulang setiap build (lebih hemat). Tidak bisa dipakai kalau isinya tergantung variabel.

**Q: Kenapa login clone tidak pakai AppBar?**
Karena aplikasi aslinya tidak punya bar judul; logonya langsung di body.

**Q: Fungsi SafeArea?**
Menghindari isi tertutup notch, status bar, atau jam di bagian atas HP.

**Q: Fungsi SingleChildScrollView?**
Membuat halaman bisa discroll. Saat keyboard muncul, ruang layar berkurang; tanpa ini muncul error overflow (garis kuning-hitam).

**Q: Bagaimana cara menampilkan gambar dari project?**
1. Taruh file di folder `assets/`.
2. Daftarkan di `pubspec.yaml` bagian `flutter: assets:`.
3. Jalankan `flutter pub get`.
4. Pakai `Image.asset("assets/logo.png")`.
Setelah menambah asset harus **hot restart**, hot reload tidak cukup.

**Q: Apa itu errorBuilder pada Image.asset?**
Widget pengganti yang ditampilkan kalau gambar gagal dimuat (file tidak ada), supaya aplikasi tidak crash.

**Q: Bagaimana toggle Guru/Murid bekerja?**
Variabel `_tab` menyimpan 0 atau 1. Fungsi `_tabButton` dipanggil dua kali dengan index 0 dan 1. Tiap tombol membandingkan `_tab == index`; kalau sama → tampil putih & tebal. Saat ditap, `setState` mengganti `_tab`, lalu kedua tombol digambar ulang.

**Q: Kenapa dibuat fungsi `_tabButton` dan `_inputDecoration`?**
Supaya tidak menulis kode yang sama dua kali (Guru/Murid, NIY/Password). Kalau mau ubah gaya, cukup ubah di satu tempat.

**Q: Apa itu Expanded?**
Membuat widget mengisi sisa ruang yang tersedia di Row/Column. Dua Expanded di satu Row → masing-masing 50%.

**Q: Apa itu GestureDetector?**
Widget pembungkus yang membuat widget biasa (Container, Text) bisa merespons sentuhan (tap, drag, dll). Dipakai karena tab bukan tombol bawaan.

**Q: Apa itu ternary operator `kondisi ? A : B`?**
Bentuk singkat if-else untuk nilai: kalau kondisi true hasilnya A, kalau false hasilnya B.

**Q: Bagaimana show/hide password bekerja?**
`obscureText` diisi variabel `_sembunyikanPassword`. Ikon mata di `suffixIcon` adalah `IconButton`; saat ditekan, `setState` membalik nilainya dengan `!`. Ikonnya juga berganti pakai ternary.

**Q: Apa itu `.copyWith`?**
Membuat salinan objek dengan sebagian properti diubah. Dipakai untuk mengambil dekorasi dasar lalu menambah `suffixIcon` hanya di field password.

**Q: Kenapa tombol Masuk dibungkus SizedBox?**
`ElevatedButton` tidak punya properti lebar/tinggi. `SizedBox(width: double.infinity, height: 56)` memaksa tombol selebar layar dan setinggi 56.

**Q: Kenapa onPressed tombol Masuk `() {}` kosong?**
Sesuai tugas, belum perlu fungsi login. Tapi tidak boleh `null`, karena `null` membuat tombol disabled (abu-abu).

**Q: Apa arti `Color(0xFF2F80ED)`?**
Warna dalam format hex ARGB. `FF` = alpha penuh (tidak transparan), `2F80ED` = kode warna biru (#2F80ED), diambil dari warna tombol aplikasi asli.

**Q: Apa bedanya `color` di Container dengan di BoxDecoration?**
Kalau Container punya `decoration`, warnanya harus ditulis di dalam `BoxDecoration`. Menulis keduanya sekaligus → error.

**Q: Apa yang belum mirip dengan aplikasi asli?**
Font. Aslinya kemungkinan Poppins, di sini masih font default Flutter (Roboto). Bisa ditambah dengan package `google_fonts`.

**Q: Kalau mau ganti halaman awal aplikasi?**
Di `main.dart`, ubah `home: const LoginClone()` ke widget lain (misal `KalkulatorPage()`), dan pastikan file-nya di-import.
