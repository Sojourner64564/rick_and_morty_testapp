import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_testapp/core/assets/app_textstyles.dart';
import 'package:rick_and_morty_testapp/core/injectable/injectable.dart';
import 'package:rick_and_morty_testapp/features/common_feature/presentation/widget/character_card_widget.dart';
import 'package:rick_and_morty_testapp/features/favorites_screen_feature/presentation/controller/sorted_favorites_cubit/sorted_favorites_cubit.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final sortedFavoritesCubit = getIt<SortedFavoritesCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortedFavoritesCubit, SortedFavoritesState>(
      bloc: sortedFavoritesCubit,
      builder: (context, state) {
        if(state is SortedFavoritesStateInitial){
          return const Center(
            child: Text(
              'Initial',
              style: AppTextstyles.w700Text20Black,
            ),
          );
        }
        if(state is SortedFavoritesStateLoading){
          return const Center(
            child: Text(
              'Loading',
              style: AppTextstyles.w700Text20Black,
            ),
          );
        }
        if(state is SortedFavoritesStateLoaded){
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
        if(state is SortedFavoritesStateLoadedEmpty){
          return const Center(
            child: Text(
              'Empty Result',
              style: AppTextstyles.w700Text20Black,
            ),
          );
        }
        if(state is SortedFavoritesStateError){
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
