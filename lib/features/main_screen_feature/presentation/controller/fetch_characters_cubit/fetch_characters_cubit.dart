import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_testapp/core/error/failure.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/character_entity.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/usecase/fetch_characters_uc.dart';

part 'fetch_characters_state.dart';

@lazySingleton
class FetchCharactersCubit extends Cubit<FetchCharactersState> {
  FetchCharactersCubit(this._fetchCharactersUC) : super(FetchCharactersStateInitial());

  final FetchCharactersUC _fetchCharactersUC;

  Future<void> fetchCharacters() async{
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
}
