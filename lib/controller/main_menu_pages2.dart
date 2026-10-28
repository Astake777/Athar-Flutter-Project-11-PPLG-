
import 'package:flutter/widgets.dart';
import 'package:fluttertest1/menu/history_page.dart';
import 'package:fluttertest1/menu/home_page.dart';
import 'package:fluttertest1/menu/profile_page.dart';
import 'package:get/get.dart';

class MainMenuController2 extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  List<Widget> listPages = [
    // Tambahkan halaman-halaman yang ingin ditampilkan di sini
    HomePage(), // Halaman pertama
    ProfilePage(), // Halaman kedua
    HistoryPage(), // Halaman ketiga
  ];
}