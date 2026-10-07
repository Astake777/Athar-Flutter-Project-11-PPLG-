import 'package:fluttertest1/pages/detail_makanan_page.dart';
import 'package:fluttertest1/pages/list_makanan_page.dart';
import 'package:fluttertest1/pages/main_menu_page.dart';

import 'pages/confirm_reg.dart';
import 'pages/kalkulator_page.dart';
import 'pages/login_clone_page.dart';
import 'pages/registration_page.dart';
import 'package:get/get.dart';

class Routes {
  // list variabel nama halaman
  static const String registration = "/registration";
  static const String confirm_registration = "/confirm_registration";
  static const String login = "/login";
  static const String kalkulator = "/kalkulator";
  static const String mainmenu = "/mainmenu";
  static const String list_makanan = "/list_makanan";
  static const String detail_makanan = "/detail_makanan";
  // others pages here

  // untuk kita daftarkan di main dart, isinya array page yang kita punya
  static final myPages = [
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirm_registration, page: () => ConfirmRegPage()),
    GetPage(name: login, page: () => LoginClonePage()),
    GetPage(name: kalkulator, page: () => KalkulatorPage()),
    GetPage(name: mainmenu, page: () => MainMenuPage()),
    GetPage(name: list_makanan, page: () => ListMakananPage()),
    GetPage(name: detail_makanan, page: () => DetailMakananPage()),
  ];
}