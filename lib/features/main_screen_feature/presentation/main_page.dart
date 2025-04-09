import 'package:flutter/material.dart';
import 'package:rick_and_morty_testapp/core/assets/app_textstyles.dart';
import 'package:rick_and_morty_testapp/core/injectable/injectable.dart';
import 'package:rick_and_morty_testapp/features/common_feature/presentation/widget/character_card_widget.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/presentation/controller/fetch_characters_cubit/fetch_characters_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final fetchCharactersCubit = getIt<FetchCharactersCubit>();

  @override
  void initState() {
    fetchCharactersCubit.fetchCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCharactersCubit, FetchCharactersState>(
      bloc: fetchCharactersCubit,
      builder: (context, state) {
        if (state is FetchCharactersStateInitial) {
          return const Center(
            child: Text(
              'Initial',
              style: AppTextstyles.w700Text20Black,
            ),
          );        }
        if (state is FetchCharactersStateLoading) {
          return const Center(
              child: Text(
                'Loading',
                style: AppTextstyles.w700Text20Black,
              ),
          );
        }
        if (state is FetchCharactersStateLoaded) {
          return GridView.builder(
            itemCount: state.characterEntity.results.length,
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
                  resultEntity: state.characterEntity.results[index],
                  isFavorite: true,
                ),
              );
            },
          );
        }
        if (state is FetchCharactersStateNoInternetError) {
          return const Center(
            child: Text(
              'No Internet',
              style: AppTextstyles.w700Text20Black,
            ),
          );        }
        if(state is FetchCharactersStateError){
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
          );        }
      },
    );
  }
}
