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
          Container(
            margin: EdgeInsets.all(10),
            child: CustomTextfield(txtController: txtAngka1, myHint: "input angka 1", numberOnly: true),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: CustomTextfield(txtController: txtAngka2, myHint: "input angka 2", numberOnly: true),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (controller.inputKosong(txtAngka1.text, txtAngka2.text)) return;
                  // panggil method tambah di controller
                  int angka1 = int.parse(txtAngka1.text);
                  int angka2 = int.parse(txtAngka2.text);
                  controller.tambah(angka1, angka2);
                },
                child: Text("+"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  if (controller.inputKosong(txtAngka1.text, txtAngka2.text)) return;
                  int angka1 = int.parse(txtAngka1.text);
                  int angka2 = int.parse(txtAngka2.text);
                  controller.kurang(angka1, angka2);
                },
                child: Text("-"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  if (controller.inputKosong(txtAngka1.text, txtAngka2.text)) return;
                  int angka1 = int.parse(txtAngka1.text);
                  int angka2 = int.parse(txtAngka2.text);
                  controller.kali(angka1, angka2);
                },
                child: Text("x"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  if (controller.inputKosong(txtAngka1.text, txtAngka2.text)) return;
                  int angka1 = int.parse(txtAngka1.text);
                  int angka2 = int.parse(txtAngka2.text);
                  controller.bagi(angka1, angka2);
                },
                child: Text("/"),
              ),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // kosongkan textfield dan hasil
              txtAngka1.clear();
              txtAngka2.clear();
              controller.reset();
            },
            child: Text("Reset"),
          ),
          Container(
            margin: EdgeInsets.all(10),
            // Obx otomatis update kalau hasil di controller berubah
            child: Obx(() => Text(
              "Hasil: ${controller.hasil}",
              style: TextStyle(fontSize: 20),
            )),
          ),
        ],
      ),
    );
  }
}
