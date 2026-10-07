import 'package:flutter/material.dart';
import 'package:fluttertest1/components/rating_stars.dart';
import 'package:fluttertest1/models/review_model.dart';

class ReviewItem extends StatelessWidget {
  // kita list variabel2 yang diperlukan
  final ReviewModel review;

  const ReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // avatar dari huruf pertama nama pembeli
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Text(
              review.namaPembeli[0].toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFEE6C2B),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.namaPembeli,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                RatingStars(rating: review.rating, size: 14),
                SizedBox(height: 6),
                Text(
                  review.komentar,
                  style: TextStyle(height: 1.4, color: Color(0xFF4A4F5C)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
