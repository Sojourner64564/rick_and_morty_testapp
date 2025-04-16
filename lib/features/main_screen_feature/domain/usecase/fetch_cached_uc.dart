import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/character_entity.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/result_entity.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/repository/fetch_cached_characters_repository.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/usecase/abstract_usecase/fetch_cached_uc.dart';

@lazySingleton
class FetchCachedUC implements AbstractFetchCachedUC{
  FetchCachedUC(this._fetchCachedCharactersRepository);

  final FetchCachedCharactersRepository _fetchCachedCharactersRepository;

  @override
  Future<List<ResultEntity>> fetchCached() async{
    return await _fetchCachedCharactersRepository.loadCache();
  }

  @override
  Future<void> saveCharactersToCache(CharacterEntity characterEntity) async{
    return await _fetchCachedCharactersRepository.saveCharactersToCache(characterEntity);
  }

}