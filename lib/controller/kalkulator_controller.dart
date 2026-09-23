import 'package:get/get.dart';

class KalkulatorController extends GetxController {
  var hasil = 0.obs;

  void tambah(int angka1, int angka2) {
    int hasiltambah= angka1 + angka2;
    hasil.value = hasiltambah;
  }
}
