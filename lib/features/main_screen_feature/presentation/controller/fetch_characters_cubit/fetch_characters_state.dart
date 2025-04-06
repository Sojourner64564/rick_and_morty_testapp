part of 'fetch_characters_cubit.dart';

abstract class FetchCharactersState {}

class FetchCharactersStateInitial extends FetchCharactersState {}
class FetchCharactersStateLoading extends FetchCharactersState {}
class FetchCharactersStateLoaded extends FetchCharactersState {
  final CharacterEntity characterEntity;

  FetchCharactersStateLoaded(this.characterEntity);
}
class FetchCharactersStateNoInternetError extends FetchCharactersState {}
class FetchCharactersStateError extends FetchCharactersState {}
