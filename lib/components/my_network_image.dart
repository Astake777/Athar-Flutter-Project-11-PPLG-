import 'package:flutter/material.dart';

class MyNetworkImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double radius;

  const MyNetworkImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: BoxFit.cover,
        // di web, kalau server gambar tidak mengizinkan CORS, muat lewat elemen img browser
        webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            width: width,
            height: height,
            color: Color(0xFFEAEAEE),
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: width,
            height: height,
            color: Color(0xFFEAEAEE),
            child: Icon(Icons.broken_image, color: Colors.grey),
          );
        },
      ),
    );
  }
}
