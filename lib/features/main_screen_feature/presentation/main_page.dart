import 'package:flutter/material.dart';
import 'package:rick_and_morty_testapp/core/assets/app_textstyles.dart';
import 'package:rick_and_morty_testapp/core/injectable/injectable.dart';
import 'package:rick_and_morty_testapp/features/common_feature/presentation/controller/favorite_card_controller/favorite_card_controller.dart';
import 'package:rick_and_morty_testapp/features/common_feature/presentation/widget/character_card_widget.dart';
import 'package:rick_and_morty_testapp/features/favorites_screen_feature/presentation/controller/sorted_favorites_cubit/sorted_favorites_cubit.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/presentation/controller/favorite_button_controller/favorite_button_cubit.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/presentation/controller/fetch_characters_cubit/fetch_characters_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});
  final fetchCharactersCubit = getIt<FetchCharactersCubit>();
  final sortedFavoritesCubit = getIt<SortedFavoritesCubit>();
  final favoriteCardController = getIt<FavoriteCardController>();
  final favoriteButtonCubit = getIt<FavoriteButtonCubit>();

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    widget.fetchCharactersCubit.fetchCharacters();
    widget.favoriteButtonCubit.updateFavoriteIdsList();
    widget.favoriteButtonCubit.rebuildCharacterCards();
    widget.sortedFavoritesCubit.loadCharactersWithoutFilter();
    scrollController.addListener((){
      widget.fetchCharactersCubit.fetchPaginatedCharacters(scrollController.offset, scrollController.position.maxScrollExtent);
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        widget.fetchCharactersCubit.fetchCharacters();
      },
      child: LayoutBuilder(// Лейаут билдер чтобы взять констрейнтс пространства между AppBar и BottomNavigationBar
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(// Скроллящийся виджет для рефреш индикатора
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: constraints.maxHeight,
             child: Center(
                child: BlocBuilder<FetchCharactersCubit, FetchCharactersState>(
                  bloc: widget.fetchCharactersCubit,
                  builder: (context, fetchCharacterState) {
                    if (fetchCharacterState is FetchCharactersStateInitial) {
                      return const Center(
                        child: Text(
                          'Initial',
                          style: AppTextstyles.w700Text20Black,
                        ),
                      );
                    }
                    if (fetchCharacterState is FetchCharactersStateLoading) {
                      return const Center(
                        child: Text(
                          'Loading',
                          style: AppTextstyles.w700Text20Black,
                        ),
                      );
                    }
                    if (fetchCharacterState is FetchCharactersStateLoaded) {
                      return RefreshIndicator(
                        onRefresh: () async{
                          widget.fetchCharactersCubit.fetchCharacters();
                        },
                        child: GridView.builder(
                          itemCount: fetchCharacterState.characterEntity.results.length,
                          controller: scrollController,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.65,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final result = fetchCharacterState.characterEntity.results[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
                                bloc: widget.favoriteButtonCubit,
                                builder: (context, favoriteButtonState) {
                                  return CharacterCardWidget(
                                    onTap: () {
                                      widget.favoriteCardController.saveFavoriteCard(result);
                                    },
                                    resultEntity: fetchCharacterState.characterEntity.results[index],
                                    isFavorite: widget.favoriteButtonCubit.isCharacterFavorite(result.id),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    }
                    if (fetchCharacterState is FetchCharactersStateCacheEmpty) {
                      return const Center(
                        child: Text(
                          'Cache Empty',
                          style: AppTextstyles.w700Text20Black,
                        ),
                      );
                    }
                    if (fetchCharacterState is FetchCharactersStateCacheError) {
                      return const Center(
                        child: Text(
                          'Cache Error',
                          style: AppTextstyles.w700Text20Black,
                        ),
                      );
                    }
                    if (fetchCharacterState is FetchCharactersStateError) {
                      return const Center(
                        child: Text(
                          'Error',
                          style: AppTextstyles.w700Text20Black,
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'Unexpected error',
                          style: AppTextstyles.w700Text20Black,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
