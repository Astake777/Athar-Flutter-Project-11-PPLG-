import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../controller/confirm_reg.dart';
import 'package:get/get.dart';

class ConfirmRegPage extends StatelessWidget {
  ConfirmRegPage({super.key});

  final controller = Get.put(ConfirmRegController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirm Registration")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Data Registrasi",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              "Nama ${controller.nama}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Text(
              "Jenis Kelamin ${controller.jenisKelamin}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Text(
              "Alamat ${controller.alamat}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Text(
              "Email ${controller.email}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Text(
              "No WA ${controller.noWa}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(height: 15),
            CustomButton(
              myText: "Oke",
              onPressed: () {
                // kembali ke halaman registration
                Get.back();
              }, label: 'Oke', text: 'Oke',
            ),
          ],
        ),
      ),
    );
  }
}