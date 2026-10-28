import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes.dart';

class RegistrationController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noWaController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final listJenisKelamin = ["Laki laki", "Perempuan"];
  var jenisKelamin = "Laki laki".obs;

  void pilihJenisKelamin(String value) {
    jenisKelamin.value = value;
  }

  void register() {
    String name = fullNameController.text;
    String alamat = alamatController.text;
    String email = emailController.text;
    String noWa = noWaController.text;
    String password = passwordController.text;

    if (name.isNotEmpty &&
        alamat.isNotEmpty &&
        email.isNotEmpty &&
        noWa.isNotEmpty &&
        password.isNotEmpty) {
      Get.snackbar(
        'Berhasil',
        'Akun $name berhasil dibuat!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

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
    fullNameController.dispose();
    alamatController.dispose();
    emailController.dispose();
    noWaController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}