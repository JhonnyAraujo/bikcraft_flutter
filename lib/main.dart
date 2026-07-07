import 'package:bikcraft/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bikcraft - Bicicletas Elétricas',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
