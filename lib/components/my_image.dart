import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String path;
  final double height;

  const MyImage({super.key, required this.path, this.height = 180});

  @override
  Widget build(BuildContext context) {
    return Image.asset(path, height: height);
  } 
}
