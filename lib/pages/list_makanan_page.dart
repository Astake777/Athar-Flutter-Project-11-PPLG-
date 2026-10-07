import 'package:flutter/material.dart';
import 'package:fluttertest1/components/makanan_card.dart';
import 'package:fluttertest1/controller/list_makanan_controller.dart';
import 'package:fluttertest1/routes.dart';
import 'package:get/get.dart';

class ListMakananPage extends StatelessWidget {
  ListMakananPage({super.key});

  final controller = Get.put(ListMakananController()); // Inisialisasi controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F6F8),
        scrolledUnderElevation: 0,
        title: Text("List Makanan", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: controller.listMakanan.length,
        itemBuilder: (context, index) {
          final makanan = controller.listMakanan[index];
          return MakananCard(
            makanan: makanan,
            onTap: () {
              // pindah ke detail makanan, kirim datanya lewat arguments
              Get.toNamed(Routes.detail_makanan, arguments: makanan);
            },
          );
        },
      ), // ListView.builder
    ); // Scaffold
  }
}
