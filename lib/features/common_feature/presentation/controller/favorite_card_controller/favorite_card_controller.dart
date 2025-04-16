import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_testapp/core/error/failure.dart';
import 'package:rick_and_morty_testapp/features/common_feature/domain/usecase/database_favorite_uc.dart';
import 'package:rick_and_morty_testapp/features/favorites_screen_feature/presentation/controller/sorted_favorites_cubit/sorted_favorites_cubit.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/result_entity.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/presentation/controller/favorite_button_controller/favorite_button_cubit.dart';

@lazySingleton
class FavoriteCardController {
  FavoriteCardController(this._databaseFavoriteUC, this._sortedFavoritesCubit,
      this._favoriteButtonController);
  final DatabaseFavoriteUC _databaseFavoriteUC;
  final SortedFavoritesCubit _sortedFavoritesCubit;
  final FavoriteButtonCubit _favoriteButtonController;

  void saveFavoriteCard(ResultEntity resultEntity) {
     _databaseFavoriteUC.saveToDB(resultEntity).then((value) {
      // Загружает любимых персонажей на странице FavoritePage
      _sortedFavoritesCubit.loadCharactersWithoutFilter();
      // Обновляет список id любимых персонажей
      _favoriteButtonController.updateFavoriteIdsList();
      _favoriteButtonController.rebuildCharacterCards();
    }).onError<Failure>((error, stackTrace) {
      //TODO добавить обратную связь
    });
  }
}
