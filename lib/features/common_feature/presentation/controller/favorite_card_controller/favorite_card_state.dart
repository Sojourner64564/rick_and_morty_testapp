part of 'favorite_card_cubit.dart';

abstract class FavoriteCardState {}

class FavoriteCardStateInitial extends FavoriteCardState {}
class FavoriteCardStateLoading extends FavoriteCardState {}
class FavoriteCardStateLoaded extends FavoriteCardState {
  final List<ResultEntity> resultEntityList;

  FavoriteCardStateLoaded(this.resultEntityList);
}
class FavoriteCardStateError extends FavoriteCardState {}

