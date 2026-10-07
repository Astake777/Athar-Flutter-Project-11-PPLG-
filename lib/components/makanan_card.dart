import 'package:flutter/material.dart';
import 'package:fluttertest1/components/my_network_image.dart';
import 'package:fluttertest1/components/rating_stars.dart';
import 'package:fluttertest1/models/makanan_model.dart';

class MakananCard extends StatelessWidget {
  // kita list variabel2 yang diperlukan
  final MakananModel makanan;
  final VoidCallback onTap;

  const MakananCard({super.key, required this.makanan, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Color(0xFFEAEAEE)),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                MyNetworkImage(
                  url: makanan.gambar,
                  width: 90,
                  height: 90,
                  radius: 12,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        makanan.namaMakanan,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2430),
                        ),
                      ),
                      SizedBox(height: 4),
                      RatingStars(rating: makanan.rating),
                      SizedBox(height: 8),
                      Text(
                        "Rp ${makanan.hargaMakanan}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEE6C2B),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF8A8F9C)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
