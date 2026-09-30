import '../routes.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController {
  void keRegistration() {
    Get.toNamed(Routes.registration);
  }

  void keKalkulator() {
    Get.toNamed(Routes.kalkulator);
  }

  // exit: kembali ke login dan hapus semua halaman sebelumnya
  void exit() {
    Get.offAllNamed(Routes.login);
  }
}