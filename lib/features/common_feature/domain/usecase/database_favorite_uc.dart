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
    return await _databaseFavoriteRepository.saveToDB(resultEntity);
  }

}