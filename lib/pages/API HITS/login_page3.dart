import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertest1/components/custom_button2.dart';
import 'package:fluttertest1/components/custom_password_field.dart';
import 'package:fluttertest1/components/custom_textfield.dart';
import 'package:fluttertest1/components/my_image.dart';
import 'package:fluttertest1/controller/API HIT PAGE/login_page3_controller.dart';
import 'package:fluttertest1/routes.dart';

class LoginPage3 extends StatelessWidget {
  LoginPage3({super.key});

  final controller = Get.put(LoginController3());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Center(child: MyImage(path: "assets/logo.png")),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Selamat Datang",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                "Masukkan username dan password untuk mengakses",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text("Username", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: CustomTextfield(
                txtController: controller.txtUsername,
                myHint: "Masukkan username",
                icon: Icons.person_outline,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: CustomPasswordField(
                txtController: controller.txtPassword,
                myHint: "Masukkan password",
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(10),
              child: Center(
                child: Obx(
                  () => controller.isLoading.value
                      ? CircularProgressIndicator()
                      : CustomButton2(
                          myText: "Masuk",
                          onPressed: () => controller.login(),
                        ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Get.toNamed(Routes.registration);
                },
                child: Text("Belum punya akun? Daftar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}