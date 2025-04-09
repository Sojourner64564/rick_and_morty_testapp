import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_testapp/core/error/failure.dart';
import 'package:rick_and_morty_testapp/features/common_feature/domain/usecase/database_favorite_uc.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/result_entity.dart';
import 'dart:developer' as dev;

part 'favorite_card_state.dart';

@lazySingleton
class FavoriteCardCubit extends Cubit<FavoriteCardState> {
  FavoriteCardCubit(this._databaseFavoriteUC) : super(FavoriteCardStateInitial());
  final DatabaseFavoriteUC _databaseFavoriteUC;

  void saveFavoriteCard(ResultEntity resultEntity){
    _databaseFavoriteUC.saveToDB(resultEntity).then((value){
      //TODO добавить обратную связь
      loadFavoriteCard();

    }).onError<Failure>((error, stackTrace){
      //TODO добавить обратную связь
    });
  }


  void loadFavoriteCard(){
    emit(FavoriteCardStateLoading());
    _databaseFavoriteUC.loadFromDB().then((entity){
      emit(FavoriteCardStateLoaded(entity));
    }).onError<Failure>((error, stackTrace){
      dev.log(error.toString());
      dev.log(stackTrace.toString());
      emit(FavoriteCardStateError());
    });
  }
}
