part of 'sorted_favorites_cubit.dart';

abstract class SortedFavoritesState {}

class SortedFavoritesStateInitial extends SortedFavoritesState {}
class SortedFavoritesStateLoading extends SortedFavoritesState {}
class SortedFavoritesStateLoaded extends SortedFavoritesState {
  final List<ResultEntity> resultEntityList;

  SortedFavoritesStateLoaded(this.resultEntityList);
}
class SortedFavoritesStateLoadedEmpty extends SortedFavoritesState{}
class SortedFavoritesStateError extends SortedFavoritesState {}
