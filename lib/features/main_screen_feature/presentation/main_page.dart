import 'package:flutter/material.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/presentation/widget/character_card_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
          childAspectRatio: 0.65,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: CharacterCardWidget(),
        );
      },
    );
  }
}
