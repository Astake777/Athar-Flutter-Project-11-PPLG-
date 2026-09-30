import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_textfield.dart';
import '../components/custom_password_field.dart';
import '../components/custom_button2.dart';
import '../components/custom_toggle.dart';
import '../components/my_image.dart';
import '../routes.dart';

class LoginClonePage extends StatefulWidget {
  const LoginClonePage({super.key});

  @override
  State<LoginClonePage> createState() => _LoginClonePageState();
}

class _LoginClonePageState extends State<LoginClonePage> {
  TextEditingController txtNiy = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  String statusLogin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // kita isi logo, judul, toggle, textfield, dan button
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
                "Masukkan niy dan password untuk mengakses",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            Container(margin: EdgeInsets.all(10), child: CustomToggle()),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text("NIY", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: CustomTextfield(
                txtController: txtNiy,
                myHint: "Masukkan NIY",
                icon: Icons.email,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: CustomPasswordField(
                txtController: txtPassword,
                myHint: "Masukkan password",
              ),
            ),
            // tampil kalau login gagal
            if (statusLogin == "failed")
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "NIY atau password salah",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(10),
              child: CustomButton2(
                myText: "Masuk",
                onPressed: () {
                  setState(() {
                    String niy = txtNiy.text.toString();
                    String password = txtPassword.text.toString();
                    if (niy == "admin" && password == "admin") {
                      print("sukses login");
                      statusLogin = "admin";
                      // get off supaya tidak bisa back ke halaman login
                      Get.offNamed(Routes.mainmenu);
                    } else {
                      print("gagal login");
                      statusLogin = "failed";
                    }
                  });
                },
              ),
            ),
            // pindah ke halaman registration
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