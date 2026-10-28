import 'package:flutter/material.dart';
import 'package:fluttertest1/components/makanan_card.dart';
import 'package:fluttertest1/controller/list_makanan_controller.dart';
import 'package:fluttertest1/routes.dart';
import 'package:get/get.dart';

class ListMakananPage extends StatelessWidget {
  ListMakananPage({super.key});

  final controller = Get.put(ListMakananController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F6F8),
        scrolledUnderElevation: 0,
        title: Text("List Makanan", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Obx(() {
        if (controller.listMakanan.isEmpty) {
          return Center(child: Text("Belum ada makanan"));
        }
        return Column(
          children: [
            SizedBox(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(12),
                itemCount: controller.listMakanan.length,
                itemBuilder: (context, index) {
                  final makanan = controller.listMakanan[index];
                  return Container(
                    width: 200,
                    margin: EdgeInsets.only(right: 12),
                    child: Dismissible(
                      key: ValueKey(makanan.namaMakanan),
                      direction: DismissDirection.down,
                      onDismissed: (direction) {
                        controller.hapus(index);
                      },
                      background: Container(
                        padding: EdgeInsets.only(top: 20),
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      child: MakananCard(
                        makanan: makanan,
                        onTap: () {
                          Get.toNamed(Routes.detail_makanan, arguments: makanan);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
