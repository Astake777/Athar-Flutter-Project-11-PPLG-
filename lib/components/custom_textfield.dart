import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  // kita list variabel2 yang diperlukan
  final TextEditingController txtController;
  final String myHint;
  final IconData? icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final bool numberOnly;

  const CustomTextfield({
    super.key,
    required this.txtController,
    required this.myHint,
    this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
    this.numberOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      obscureText: obscureText,
      // kalau numberOnly true, keyboard angka dan hanya bisa input angka
      keyboardType: numberOnly ? TextInputType.number : keyboardType,
      inputFormatters: numberOnly
          ? [FilteringTextInputFormatter.digitsOnly]
          : inputFormatters,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hint: Text(myHint),
        prefixIcon: icon != null ? Icon(icon) : null,
        suffixIcon: suffixIcon,
      ),
    );
  }
}