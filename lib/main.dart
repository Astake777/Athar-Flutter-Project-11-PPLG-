import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My Learning App",
      initialRoute: Routes.list_makanan, // Set halaman awal ke ListMakananPage
      getPages: Routes.myPages,
    );
  }
}