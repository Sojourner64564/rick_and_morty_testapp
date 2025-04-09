import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_card_state.dart';

class FavoriteCardCubit extends Cubit<FavoriteCardState> {
  FavoriteCardCubit() : super(FavoriteCardInitial());

  Future<void> saveCard() async{

  }
}
