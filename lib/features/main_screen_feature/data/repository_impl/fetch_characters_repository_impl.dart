import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_testapp/features/common_feature/data/remote_ds/retrofit_remote_client.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/character_entity.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/repository/fetch_characters_repository.dart';

@lazySingleton
class FetchCharactersRepositoryImpl implements FetchCharactersRepository{
  FetchCharactersRepositoryImpl(this.retrofitRemoteClientInstance);

  final RetrofitRemoteClientInstance retrofitRemoteClientInstance;

  @override
  Future<CharacterEntity> fetchCharacters() {
    final model = retrofitRemoteClientInstance.client().fetchCharacters();

  }

}