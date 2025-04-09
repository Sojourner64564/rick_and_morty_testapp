import 'package:rick_and_morty_testapp/features/common_feature/domain/repository/database_repository.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/result_entity.dart';

class DatabaseFavoriteUC implements DatabaseFavoriteRepository{
  DatabaseFavoriteUC(this.databaseFavoriteRepository);

  final DatabaseFavoriteRepository databaseFavoriteRepository;


  @override
  Future<List<ResultEntity>> loadFromDB() async{
    return await databaseFavoriteRepository.loadFromDB();
  }

  @override
  Future<bool> saveToDB(ResultEntity resultEntity) async{
    return await databaseFavoriteRepository.saveToDB(resultEntity);
  }

}