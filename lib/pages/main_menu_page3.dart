import 'package:flutter/material.dart';
import 'package:fluttertest1/controller/main_menu_page3.dart';
import 'package:get/get.dart';

class MainMenuPage3 extends StatelessWidget {
  MainMenuPage3({super.key});

  final mainMenuController = Get.put(MainMenuController3());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        appBar: AppBar(
          backgroundColor: Color(0xFFF2F2F2),
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: Text(
            mainMenuController.listJudul[mainMenuController.selectedIndex.value],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text("Home"),
                selected: mainMenuController.selectedIndex.value == 0,
                onTap: () => mainMenuController.changePage(0),
              ),
              ListTile(
                leading: Icon(Icons.history_outlined),
                title: Text("History"),
                selected: mainMenuController.selectedIndex.value == 1,
                onTap: () => mainMenuController.changePage(1),
              ),
              ListTile(
                leading: Icon(Icons.person_outline),
                title: Text("Profile"),
                selected: mainMenuController.selectedIndex.value == 2,
                onTap: () => mainMenuController.changePage(2),
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: mainMenuController.selectedIndex.value,
          children: mainMenuController.listPages,
        ),
      ),
    );
  }
}
