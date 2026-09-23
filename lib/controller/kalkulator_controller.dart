import 'package:get/get.dart';

class KalkulatorController extends GetxController {
  var hasil = 0.0.obs;

  // cek input kosong, kalau kosong tampilkan peringatan
  bool inputKosong(String angka1, String angka2) {
    if (angka1.isEmpty || angka2.isEmpty) {
      Get.snackbar(
        "input kosong",
        "angka 1 dan angka 2 harus diisi",
        snackPosition: SnackPosition.TOP,
      );
      return true;
    }
    return false;
  }

  void reset() {
    hasil.value = 0;
  }

  // method tambah kurang kali dan bagi
  void tambah(int angka1, int angka2) {
    double hasilTambah = (angka1 + angka2).toDouble();
    hasil.value = hasilTambah;
    Get.snackbar(
      "hasil tambah",
      "hasilnya ${hasilTambah}",
      snackPosition: SnackPosition.TOP,
    );
  }

  void kurang(int angka1, int angka2) {
    double hasilKurang = (angka1 - angka2).toDouble();
    hasil.value = hasilKurang;
    Get.snackbar(
      "hasil kurang",
      "hasilnya ${hasilKurang}",
      snackPosition: SnackPosition.TOP,
    );
  }

  void kali(int angka1, int angka2) {
    double hasilKali = (angka1 * angka2).toDouble();
    hasil.value = hasilKali;
    Get.snackbar(
      "hasil kali",
      "hasilnya ${hasilKali}",
      snackPosition: SnackPosition.TOP,
    );
  }

  void bagi(int angka1, int angka2) {
    double hasilBagi = angka1 / angka2;
    hasil.value = hasilBagi;
    Get.snackbar(
      "hasil bagi",
      "hasilnya ${hasilBagi}",
      snackPosition: SnackPosition.TOP,
    );
  }
}
