import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes.dart';

class RegistrationController extends GetxController {
  // 1. Deklarasi controller untuk mengelola input dari pengguna
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noWaController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // pilihan jenis kelamin untuk dropdown
  final listJenisKelamin = ["Laki laki", "Perempuan"];
  var jenisKelamin = "Laki laki".obs;

  void pilihJenisKelamin(String value) {
    jenisKelamin.value = value;
  }

  // 2. Fungsi yang akan dijalankan saat tombol "Register" ditekan
  void register() {
    String name = fullNameController.text;
    String alamat = alamatController.text;
    String email = emailController.text;
    String noWa = noWaController.text;
    String password = passwordController.text;

    // Contoh validasi sederhana
    if (name.isNotEmpty &&
        alamat.isNotEmpty &&
        email.isNotEmpty &&
        noWa.isNotEmpty &&
        password.isNotEmpty) {
      // Menampilkan notifikasi pop-up bawaan GetX jika berhasil
      Get.snackbar(
        'Berhasil',
        'Akun $name berhasil dibuat!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // pindah ke halaman confirm registration dan kirim data lewat arguments
      Get.toNamed(
        Routes.confirm_registration,
        arguments: {
          'name': name,
          'jenis_kelamin': jenisKelamin.value,
          'alamat': alamat,
          'email': email,
          'no_wa': noWa,
        },
      );
    } else {
      // Menampilkan pesan error jika ada kolom yang kosong
      Get.snackbar(
        'Gagal',
        'Pastikan semua kolom telah diisi',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    // 3. Wajib: Membersihkan controller dari memori agar aplikasi tidak berat/bocor (memory leak)
    fullNameController.dispose();
    alamatController.dispose();
    emailController.dispose();
    noWaController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}