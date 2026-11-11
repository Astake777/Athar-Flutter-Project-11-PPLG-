import 'package:flutter/widgets.dart';
import 'package:fluttertest1/menu/home_page3.dart';
import 'package:fluttertest1/menu/profile_page3.dart';
import 'package:get/get.dart';

class MainMenuController3 extends GetxController {
  final RxInt selectedIndex = 0.obs;

  List<String> listJudul = ["Home Page", "History Page", "Profile"];

  List<Widget> listPages = [
    HomePage3(),
    Center(child: Text("This is the History Page")),
    ProfilePage3(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
    Get.back();
  }
}
