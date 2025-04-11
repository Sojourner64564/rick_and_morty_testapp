import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_testapp/features/common_feature/domain/repository/database_repository.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/result_entity.dart';

@lazySingleton
class DatabaseFavoriteUC implements DatabaseFavoriteRepository{
  DatabaseFavoriteUC(this._databaseFavoriteRepository);

  final DatabaseFavoriteRepository _databaseFavoriteRepository;


  @override
  Future<List<ResultEntity>> loadFromDB() async{
    return await _databaseFavoriteRepository.loadFromDB();
  }

  @override
  Future<void> saveToDB(ResultEntity resultEntity) async{
    final allFavoritesCharacter = await _databaseFavoriteRepository.loadFromDB();
    final List<ResultEntity> overlapResultEntity = [];
    allFavoritesCharacter.forEach((value){
      if(value.id==resultEntity.id){
        overlapResultEntity.add(value);
      }
    });
    overlapResultEntity.forEach((value){
       _databaseFavoriteRepository.deleteFromDB(value.id);
    });
    print("overlap list $overlapResultEntity");
    if(overlapResultEntity.isEmpty){
      print('dfdfd');
      return await _databaseFavoriteRepository.saveToDB(resultEntity);
    }
  }

  @override
  Future<List<ResultEntity>> loadNameFilteredFromDB(String text) async{
    if(text.isEmpty){
      return await _databaseFavoriteRepository.loadFromDB();
    }
    // Дебаунсер на запросы к базе данных
    await Future.delayed(const Duration(milliseconds: 300));
    return await _databaseFavoriteRepository.loadNameFilteredFromDB(text);

  }

  @override
  Future<List<int>> favoriteIds() async{
    return await _databaseFavoriteRepository.favoriteIds();
  }

  @override
  void deleteFromDB(int characterId){
    return  _databaseFavoriteRepository.deleteFromDB(characterId);
  }

}