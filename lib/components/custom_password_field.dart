import 'package:flutter/material.dart';
import 'package:fluttertest1/components/custom_textfield.dart';

class CustomPasswordField extends StatefulWidget {
  // kita list variabel2 yang diperlukan
  final TextEditingController txtController;
  final String myHint;

  const CustomPasswordField({
    super.key,
    required this.txtController,
    required this.myHint,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool sembunyikan = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextfield(
      txtController: widget.txtController,
      myHint: widget.myHint,
      icon: Icons.shield,
      obscureText: sembunyikan,
      // icon mata untuk lihat / sembunyikan password
      suffixIcon: IconButton(
        icon: Icon(sembunyikan ? Icons.visibility_off : Icons.visibility),
        onPressed: () {
          setState(() {
            sembunyikan = !sembunyikan;
          });
        },
      ),
    );
  }
}
