import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/data/model/character_model.dart';

part 'retrofit_remote_client.g.dart';

@RestApi(baseUrl: 'https://rickandmortyapi.com/api')
abstract class RetrofitRemoteClient {
  factory RetrofitRemoteClient(Dio dio, {String? baseUrl}) = _RetrofitRemoteClient;

  @GET('/character')
  Future<CharacterModel> fetchCharacters();

/*  @GET('/top-headlines?category={category}&apiKey={apiKey}')
  Future<NewsModel> fetchNewsByTopic({
    @Path('apiKey') required String apiKey,
    @Path('category') required String category,
  });*/
}

@injectable
class RetrofitRemoteClientInstance {
  RetrofitRemoteClient client() {
    return _RetrofitRemoteClient(Dio());
  }
}
