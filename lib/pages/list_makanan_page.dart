import 'package:flutter/material.dart';
import 'package:fluttertest1/components/makanan_horizontal_list.dart';

class ListMakananPage extends StatelessWidget {
  const ListMakananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F6F8),
        scrolledUnderElevation: 0,
        title: Text("List Makanan", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: MakananHorizontalList(),
    );
  }
}
