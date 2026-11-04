import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertest1/routes.dart';

class LoginController3 extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> login() async {
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Get.snackbar("Peringatan", "Username dan password harus diisi");
      return;
    }

    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse("https://mediadwi.com/api/latihan/login"),
        body: {"username": txtUsername.text, "password": txtPassword.text},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["status"] == true) {
          Get.snackbar("Sukses", data["message"]);
          Get.offNamed(Routes.main_menu_page3);
        } else {
          Get.snackbar("Gagal", data["message"]);
        }
      } else {
        Get.snackbar("Error", "Server error: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Gagal", "Tidak dapat terhubung ke server");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.onClose();
  }
}