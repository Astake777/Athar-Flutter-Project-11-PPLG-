import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  final String myText;
  final VoidCallback onPressed;
  final Color? myColor;

  const CustomButton2({
    super.key,
    required this.myText,
    required this.onPressed,
    this.myColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: myColor,
          foregroundColor: myColor != null ? Colors.white : null,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(myText),
      ),
    );
  }
}