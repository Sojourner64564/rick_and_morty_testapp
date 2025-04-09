import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_testapp/core/assets/app_colors.dart';
import 'package:rick_and_morty_testapp/core/assets/app_textstyles.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/presentation/main_page.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'Rick And Morty App',
            style: AppTextstyles.w700Text25Black,
        ),
        backgroundColor: AppColors.blueColor,
      ),
      body: MainPage(),
    );
  }
}
