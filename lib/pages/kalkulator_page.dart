import 'package:flutter/material.dart';
import 'package:fluttertest1/components/custom_textfield.dart';
import 'package:fluttertest1/controller/kalkulator_controller.dart';
import 'package:get/get.dart';

class KalkulatorPage extends StatelessWidget {
  KalkulatorPage({super.key});

  final controller = Get.put(KalkulatorController());

  @override
  Widget build(BuildContext context) {
    TextEditingController txtAngka1 = TextEditingController();
    TextEditingController txtAngka2 = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("kalkulator")),
      body: Column(
        children: [
          CustomTextfield(txtController: txtAngka1, myHint: "input angka 1"),
          CustomTextfield(txtController: txtAngka2, myHint: "input angka 2"),
          ElevatedButton(
            onPressed: () {
              // panggil method tambah di controller
              int angka1 = int.parse(txtAngka1.text);
              int angka2 = int.parse(txtAngka2.text);
              controller.tambah(angka1, angka2);
            },
            child: Text("Tambah"),
          ),
          Obx(
            () => Text(
              controller.hasil.toString(),
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
