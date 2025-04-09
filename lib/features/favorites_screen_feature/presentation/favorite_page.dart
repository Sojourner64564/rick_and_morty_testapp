import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_testapp/core/assets/app_textstyles.dart';
import 'package:rick_and_morty_testapp/core/injectable/injectable.dart';
import 'package:rick_and_morty_testapp/features/common_feature/presentation/controller/favorite_card_controller/favorite_card_cubit.dart';
import 'package:rick_and_morty_testapp/features/common_feature/presentation/widget/character_card_widget.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final favoriteCardCubit = getIt<FavoriteCardCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCardCubit, FavoriteCardState>(
      bloc: favoriteCardCubit,
      builder: (context, state) {
        if(state is FavoriteCardStateInitial){
          return const Center(
            child: Text(
              'Initial',
              style: AppTextstyles.w700Text20Black,
            ),
          );
        }
        if(state is FavoriteCardStateLoading){
          return const Center(
            child: Text(
              'Loading',
              style: AppTextstyles.w700Text20Black,
            ),
          );
        }
        if(state is FavoriteCardStateLoaded){
          return GridView.builder(
            itemCount: state.resultEntityList.length,
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
                  resultEntity: state.resultEntityList[index],
                  isFavorite: true,
                ),
              );
            },
          );
        }
        if(state is FavoriteCardStateError){
          return const Center(
            child: Text(
              'Error',
              style: AppTextstyles.w700Text20Black,
            ),
          );
        }else{
          return const Center(
            child: Text(
              'Unexpected Error',
              style: AppTextstyles.w700Text20Black,
            ),
          );
        }


      },
    );
  }
}
