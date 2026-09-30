import 'package:get/get.dart';

class ConfirmRegController extends GetxController {
  late String nama;
  late String jenisKelamin;
  late String alamat;
  late String email;
  late String noWa;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    nama = arguments['name'];
    jenisKelamin = arguments['jenis_kelamin'];
    alamat = arguments['alamat'];
    email = arguments['email'];
    noWa = arguments['no_wa'];
  }
}