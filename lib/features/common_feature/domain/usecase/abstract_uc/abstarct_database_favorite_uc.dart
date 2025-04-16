import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/result_entity.dart';

abstract class AbstractDatabaseFavoriteUC{
  Future<List<ResultEntity>> loadFromDB();
  Future<void> saveToDB(ResultEntity resultEntity);
  Future<List<ResultEntity>> loadNameFilteredFromDB(String text);
  Future<List<int>> favoriteIds();
/*
  Future<void> deleteFromDB(int characterId);
*/
  Future<List<ResultEntity>> deleteAndLoadFiltered(String text, int characterId);
}