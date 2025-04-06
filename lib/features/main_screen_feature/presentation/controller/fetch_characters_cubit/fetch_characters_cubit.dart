import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/usecase/fetch_characters_uc.dart';

part 'fetch_characters_state.dart';

class FetchCharactersCubit extends Cubit<FetchCharactersState> {
  FetchCharactersCubit(this.fetchCharactersUC) : super(FetchCharactersStateInitial());

  final FetchCharactersUC fetchCharactersUC;

  Future<void> fetchCharacters() async{
    emit(FetchCharactersStateLoading());
    final model = await fetchCharactersUC.fetchCharacters().catchError((error){
      emit(FetchCharactersStateError());
      
    });
    final fdd = dfd.catchError((){

    });

  }
}
