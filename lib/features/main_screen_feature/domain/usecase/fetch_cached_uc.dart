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
    //логика чтобы не сохранять дубликаты
    final cached = await _fetchCachedCharactersRepository.loadCache();
    //Разница между листами
    final difference = characterEntity.results.where((id1) => !cached.any((id2) => id2.id == id1.id)).toList();
    return await _fetchCachedCharactersRepository.saveCharactersToCache(difference);
  }

}