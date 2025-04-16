import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/result_entity.dart';

abstract class FetchCachedCharactersRepository{
  Future<void> saveCharactersToCache(List<ResultEntity> listResultEntity);
  Future<List<ResultEntity>> loadCache();
}