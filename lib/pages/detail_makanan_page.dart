import 'package:flutter/material.dart';
import 'package:fluttertest1/components/custom_button2.dart';
import 'package:fluttertest1/components/my_network_image.dart';
import 'package:fluttertest1/components/rating_stars.dart';
import 'package:fluttertest1/components/review_item.dart';
import 'package:fluttertest1/models/makanan_model.dart';
import 'package:get/get.dart';

class DetailMakananPage extends StatelessWidget {
  DetailMakananPage({super.key});

  // data makanan dikirim dari halaman list lewat arguments
  final MakananModel makanan = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // gambar di belakang, isi detail menimpa dari bawah
          MyNetworkImage(url: makanan.gambar, width: double.infinity, height: 300),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 270),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          makanan.namaMakanan,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F2430),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Rp ${makanan.hargaMakanan}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEE6C2B),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      RatingStars(rating: makanan.rating, size: 22),
                      SizedBox(width: 8),
                      Text(
                        "${makanan.rating}/5",
                        style: TextStyle(color: Color(0xFF8A8F9C)),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Deskripsi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    makanan.desc,
                    style: TextStyle(height: 1.5, color: Color(0xFF4A4F5C)),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Review Pembeli (${makanan.review.length})",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  // kalau belum ada review, tampilkan teks kosong
                  if (makanan.review.isEmpty)
                    Text("Belum ada review", style: TextStyle(color: Color(0xFF8A8F9C))),
                  for (var review in makanan.review) ReviewItem(review: review),
                ],
              ),
            ),
          ),
          // tombol back bulat di atas gambar
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFF1F2430)),
                  onPressed: () => Get.back(),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            child: CustomButton2(
              myText: "Kembali",
              myColor: Color(0xFFEE6C2B),
              onPressed: () => Get.back(),
            ),
          ),
        ),
      ),
    );
  }
}
