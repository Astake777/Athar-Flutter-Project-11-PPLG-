import 'package:fluttertest1/models/review_model.dart';

class MakananModel {
  String namaMakanan;
  String hargaMakanan;
  String gambar; // url gambar
  String desc; // info makanan
  int rating; // jumlah bintang 1-5
  List<ReviewModel> review; // review dari pembeli

  MakananModel({
    required this.namaMakanan,
    required this.hargaMakanan,
    required this.gambar,
    required this.desc,
    required this.rating,
    required this.review,
  });
}
