import 'package:flutter/material.dart';
import 'package:fluttertest1/controller/main_menu_pages2.dart';
import 'package:get/get.dart';

class MainMenuPage2 extends StatelessWidget {
  MainMenuPage2({super.key});

  final mainMenuController = Get.put(MainMenuController2());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: mainMenuController.selectedIndex.value,
          children: mainMenuController.listPages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: mainMenuController.changePage,
          currentIndex: mainMenuController.selectedIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "home",
            ),
                        BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined),
              label: "history",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "profile",
            ),
          ],
        ),
      ),
    );
  }
}