import 'package:flutter/material.dart';
import 'package:rick_and_morty_testapp/features/common_feature/presentation/widget/character_card_widget.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/result_entity.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 32,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CharacterCardWidget(
            onTap: () {

            },
            resultEntity: const ResultEntity(),
            isFavorite: true,
          ),
        );
      },
    );
  }
}
