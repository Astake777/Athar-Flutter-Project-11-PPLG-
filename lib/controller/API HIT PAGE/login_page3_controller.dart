import 'package:flutter/material.dart';
import 'package:fluttertest1/models/login_model.dart';
import 'package:fluttertest1/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController3 extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  RxBool isLoading = false.obs;

  var loginModel = Rxn<LoginModel>();

  Future<void> login() async {
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Get.snackbar("error", "username dan password harus terisi");
      return;
    }

    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse("https://mediadwi.com/api/latihan/login"),
        body: {"username": txtUsername.text, "password": txtPassword.text},
      );

      if (response.statusCode == 200) {
        loginModel.value = loginModelFromJson(response.body);

        if (loginModel.value?.status == true) {
          Get.snackbar("berhasil", loginModel.value!.message);
          Get.offNamed(Routes.main_menu_page3);
        } else {
          Get.snackbar("gagal", loginModel.value!.message);
        }
      } else {
        Get.snackbar("gagal", "cek internet connection");
      }
    } catch (e) {
      Get.snackbar("gagal", "Tidak dapat terhubung ke server");
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
