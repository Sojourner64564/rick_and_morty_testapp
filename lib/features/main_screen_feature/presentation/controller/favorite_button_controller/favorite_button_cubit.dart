import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_testapp/features/common_feature/domain/usecase/database_favorite_uc.dart';

@lazySingleton
class FavoriteButtonCubit extends Cubit<FavoriteButtonState>{
  FavoriteButtonCubit(this._databaseFavoriteUC) : super(FavoriteButtonState());

  final DatabaseFavoriteUC _databaseFavoriteUC;
  List<int> favoriteCharacterIdsList = [];

  void updateFavoriteIdsList() {
      _databaseFavoriteUC.favoriteIds().then((value) {
      favoriteCharacterIdsList = value;
    }).onError((error, stackTrace) {
      //TODO обратная свзязь
    });
  }

  bool isCharacterFavorite(int id) {
    return favoriteCharacterIdsList.contains(id);
  }

  /// Для обновдения виджетов CharacterCard
  void rebuildCharacterCards(){
    emit(FavoriteButtonState());
  }
}
//TODO сделать без такого момента
class FavoriteButtonState{}
