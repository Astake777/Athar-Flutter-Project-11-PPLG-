import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // untuk digitsOnly

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  // controller untuk baca isi TextField
  final TextEditingController _a1 = TextEditingController();
  final TextEditingController _a2 = TextEditingController();
  String _hasil = "";

  void _hitung(String operator) {
    // ubah text jadi angka, kalau kosong jadi 0
    final double a1 = double.tryParse(_a1.text) ?? 0;
    final double a2 = double.tryParse(_a2.text) ?? 0;
    double hasil = 0;

    if (operator == "+") hasil = a1 + a2;
    if (operator == "-") hasil = a1 - a2;
    if (operator == "x") hasil = a1 * a2;
    if (operator == "/") hasil = a1 / a2;

    // setState supaya text hasil ikut berubah
    setState(() {
      _hasil = "$a1 $operator $a2 = $hasil";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Calculator"),
      ), // AppBar
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              controller: _a1,
              keyboardType: TextInputType.number, // num only
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: "A1",
              ),
            ),
          ), // Container
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              controller: _a2,
              keyboardType: TextInputType.number, // num only
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: "A2",
              ),
            ),
          ), // Container
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _hitung("+"),
                child: const Text("+"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _hitung("-"),
                child: const Text("-"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _hitung("x"),
                child: const Text("x"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _hitung("/"),
                child: const Text("/"),
              ),
            ],
          ), // Row
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              "Hasil: $_hasil",
              style: const TextStyle(fontSize: 20),
            ),
          ), // Container
        ],
      ), // Column
    ); // Scaffold
  }
}
