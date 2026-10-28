import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  // kita list variabel2 yang diperlukan
  final String myText;
  final VoidCallback onPressed;
  final Color? myColor;

  const CustomButton({
    super.key,
    required this.myText,
    required this.onPressed,
    this.myColor, required String label, required String text,
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