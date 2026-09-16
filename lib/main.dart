import 'package:flutter/material.dart';
// Pastikan nama package ini sesuai dengan yang ada di pubspec.yaml Anda
import 'package:fluttertest1/pages/login_clone_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Tambahkan kata "ColorScheme" sebelum ".fromSeed"
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginClonePage()
    );
  }
}