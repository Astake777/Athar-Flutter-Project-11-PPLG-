import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  // kita list variabel2 yang diperlukan
  final TextEditingController txtController;
  final String myHint;
  final bool obscureText;
  final IconData? icon;
  final Widget? suffixIcon;

  const CustomTextfield({
    super.key,
    required this.txtController,
    required this.myHint,
    this.obscureText = false,
    this.icon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hint: Text(myHint),
        prefixIcon: icon == null ? null : Icon(icon, color: Colors.blue),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
