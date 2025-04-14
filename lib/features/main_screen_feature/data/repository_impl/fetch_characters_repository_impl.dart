import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_testapp/core/error/failure.dart';
import 'package:rick_and_morty_testapp/core/network/network_info.dart';
import 'package:rick_and_morty_testapp/features/common_feature/data/remote_ds/retrofit_remote_client.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/data/model/extension/extension_character_model_to_entity.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/character_entity.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/repository/fetch_characters_repository.dart';

@LazySingleton(as: FetchCharactersRepository)
class FetchCharactersRepositoryImpl implements FetchCharactersRepository{
  FetchCharactersRepositoryImpl(this.retrofitRemoteClientInstance, this.networkInfo);

  final RetrofitRemoteClientInstance retrofitRemoteClientInstance;
  final NetworkInfo networkInfo;

  @override
  Future<CharacterEntity> fetchCharacters() async{
    if(! await networkInfo.isConnected) throw NoInternetFailure();
    final model = await retrofitRemoteClientInstance.client().fetchCharacters();
    final entity = model.toEntity();
    return entity;
  }

  @override
  Future<CharacterEntity> fetchPaginatedCharacters(String url) async{
    if(! await networkInfo.isConnected) throw NoInternetFailure();
    final model = await retrofitRemoteClientInstance.client().fetchPaginatedCharacters(url);
    final entity = model.toEntity();
    return entity;
  }

}