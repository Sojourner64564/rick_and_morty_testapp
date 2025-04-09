import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_testapp/core/error/failure.dart';
import 'package:rick_and_morty_testapp/features/common_feature/domain/usecase/database_favorite_uc.dart';
import 'package:rick_and_morty_testapp/features/favorites_screen_feature/presentation/controller/sorted_favorites_cubit/sorted_favorites_cubit.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/result_entity.dart';


@lazySingleton
class FavoriteCardController{
  FavoriteCardController(this._databaseFavoriteUC, this._sortedFavoritesCubit);
  final DatabaseFavoriteUC _databaseFavoriteUC;
  final SortedFavoritesCubit _sortedFavoritesCubit;

  void saveFavoriteCard(ResultEntity resultEntity){
    _databaseFavoriteUC.saveToDB(resultEntity).then((value){
      //TODO добавить обратную связь

      _sortedFavoritesCubit.loadCharactersWithoutFilter();
    }).onError<Failure>((error, stackTrace){
      //TODO добавить обратную связь
    });
  }
}
