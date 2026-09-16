import 'package:flutter/material.dart';
import 'package:fluttertest1/components/custom_textfield.dart';
import 'package:fluttertest1/components/custom_password_field.dart';
import 'package:fluttertest1/components/custom_button.dart';
import 'package:fluttertest1/components/custom_toggle.dart';
import 'package:fluttertest1/components/my_image.dart';

class LoginClonePage extends StatelessWidget {
  const LoginClonePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txtNiy = TextEditingController();
    TextEditingController txtPassword = TextEditingController();
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
            SizedBox(height: 20),
            Container(margin: EdgeInsets.all(10), child: CustomButton(text: "Masuk")),
          ],
        ),
      ),
    );
  }
}
