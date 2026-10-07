import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  // kita list variabel2 yang diperlukan
  final int rating;
  final double size;

  const RatingStars({super.key, required this.rating, this.size = 16});

  @override
  Widget build(BuildContext context) {
    // 5 bintang, yang terisi sesuai nilai rating
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star_rounded : Icons.star_border_rounded,
          size: size,
          color: index < rating ? Color(0xFFFFB400) : Color(0xFFD0D3DA),
        );
      }),
    );
  }
}
