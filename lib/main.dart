import 'package:flutter/material.dart';
import 'package:rick_and_morty_testapp/core/injectable/injectable.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/presentation/main_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}
