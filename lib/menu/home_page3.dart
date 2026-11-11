import 'package:flutter/material.dart';
import 'package:fluttertest1/components/makanan_horizontal_list.dart';

class HomePage3 extends StatelessWidget {
  const HomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Text(
            "Makanan",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        MakananHorizontalList(),
      ],
    );
  }
}
