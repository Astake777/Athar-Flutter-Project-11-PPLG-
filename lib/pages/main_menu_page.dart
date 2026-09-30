import 'package:flutter/material.dart';
import 'package:fluttertest1/controller/main_menu_controller.dart';
import '../components/custom_button.dart';
import 'package:get/get.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final controller = Get.put(MainMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Menu")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle, size: 80, color: Colors.deepPurple),
            Text(
              "Selamat Datang",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "Pilih menu di bawah ini",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: CustomButton(
                myText: "Registration",
                onPressed: () => controller.keRegistration(),
                label: 'Registration', text: 'Registration',
              ),
            ),
            SizedBox(
              width: 250,
              child: CustomButton(
                myText: "Kalkulator",
                onPressed: () => controller.keKalkulator(),
                label: 'Kalkulator', text: 'Kalkulator',
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: CustomButton(
                myText: "Exit",
                myColor: Colors.red,
                label: 'Exit', text: 'Exit',
                onPressed: () => controller.exit(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}