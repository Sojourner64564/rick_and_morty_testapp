import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/character_entity.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/repository/fetch_characters_repository.dart';

@lazySingleton
class FetchCharactersUC implements FetchCharactersRepository{
  FetchCharactersUC(this.fetchCharactersRepository);

  final FetchCharactersRepository fetchCharactersRepository;

  @override
  Future<CharacterEntity> fetchCharacters() async{
    return await fetchCharactersRepository.fetchCharacters();
  }

  @override
  Future<CharacterEntity> fetchPaginatedCharacters(String url) async{
    return await fetchCharactersRepository.fetchPaginatedCharacters(url);
  }
}