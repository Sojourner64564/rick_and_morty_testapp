import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_testapp/core/error/failure.dart';
import 'package:rick_and_morty_testapp/features/common_feature/domain/usecase/database_favorite_uc.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/result_entity.dart';

part 'sorted_favorites_state.dart';

@lazySingleton
class SortedFavoritesCubit extends Cubit<SortedFavoritesState> {
  SortedFavoritesCubit(this.databaseFavoriteUC) : super(SortedFavoritesStateInitial());
  final DatabaseFavoriteUC databaseFavoriteUC;


  void sortCharacters(String text){
    emit(SortedFavoritesStateLoading());
    databaseFavoriteUC.loadNameFilteredFromDB(text).then((entity){
      if(entity.isEmpty) {
        emit(SortedFavoritesStateLoadedEmpty());
      }else{
        emit(SortedFavoritesStateLoaded(entity));
      }
    }).onError<Failure>((error, stackTrace){
        emit(SortedFavoritesStateError());
    });
  }

  void loadCharactersWithoutFilter(){
    emit(SortedFavoritesStateLoading());
    databaseFavoriteUC.loadFromDB().then((entity){
      if(entity.isEmpty) {
        emit(SortedFavoritesStateLoadedEmpty());
      }else{
        emit(SortedFavoritesStateLoaded(entity));
      }
    }).onError<Failure>((error, stackTrace){
      emit(SortedFavoritesStateError());
    });
  }


}
