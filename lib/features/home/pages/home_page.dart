import 'package:bikcraft/features/home/widgets/home_header.dart';
import 'package:bikcraft/features/home/widgets/home_hero.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [HomeHeader(), HomeHero()]),
      ),
    );
  }
}
