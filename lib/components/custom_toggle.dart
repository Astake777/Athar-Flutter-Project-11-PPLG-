import 'package:flutter/material.dart';

class CustomToggle extends StatefulWidget {
  const CustomToggle({super.key});

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  int tab = 0; // 0 = Guru, 1 = Murid

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [tombolTab("Guru", 0), tombolTab("Murid", 1)]),
    );
  }

  // tab jadi putih kalau lagi dipilih
  Widget tombolTab(String label, int index) {
    bool aktif = tab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            tab = index;
          });
        },
        child: Container(
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: aktif ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: aktif ? FontWeight.bold : FontWeight.normal,
              color: aktif ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
