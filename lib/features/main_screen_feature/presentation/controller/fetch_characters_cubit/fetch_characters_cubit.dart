import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_testapp/core/error/failure.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/character_entity.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/extension/extension_character_entity_to_updated.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/usecase/fetch_characters_uc.dart';

part 'fetch_characters_state.dart';

@lazySingleton
class FetchCharactersCubit extends Cubit<FetchCharactersState> {
  FetchCharactersCubit(this._fetchCharactersUC) : super(FetchCharactersStateInitial());

  final FetchCharactersUC _fetchCharactersUC;

  void fetchCharacters() {
    emit(FetchCharactersStateLoading());
    _fetchCharactersUC.fetchCharacters().then((entity){
      emit(FetchCharactersStateLoaded(entity));
    }).onError<Failure>((error, stackTrace){
      if(error is NoInternetFailure){
        emit(FetchCharactersStateNoInternetError());
      }
      if(error is AppFailure){
        emit(FetchCharactersStateError());
      }
    });
}

  void fetchPaginatedCharacters(double actualOffset, double maxScroll) {
    if(state is! FetchCharactersStateLoaded) return;
    if((state as FetchCharactersStateLoaded).characterEntity.info.next == '') return;
    // На 90 процентов от максимальной длины страницы будет добавляться следующая страница
    if(!((maxScroll*0.9)<actualOffset)) return;

    final fetchCharactersStateLoaded = state as FetchCharactersStateLoaded;

    _fetchCharactersUC.fetchPaginatedCharacters(fetchCharactersStateLoaded.characterEntity.info.next).then((entity){
      emit(FetchCharactersStateLoaded(fetchCharactersStateLoaded.characterEntity.updatedWith(entity)));
    }).onError<Failure>((error, stackTrace){
      if(error is NoInternetFailure){
        //TODO сделать обратную связь
      }
      if(error is AppFailure){
        //TODO сделать обратную связь
      }
    });
  }
}
