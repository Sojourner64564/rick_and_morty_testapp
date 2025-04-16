part of 'fetch_characters_cubit.dart';

abstract class FetchCharactersState {}

class FetchCharactersStateInitial extends FetchCharactersState {}
class FetchCharactersStateLoading extends FetchCharactersState {}
class FetchCharactersStateLoaded extends FetchCharactersState {
  final CharacterEntity characterEntity;

  FetchCharactersStateLoaded(this.characterEntity);
}
class FetchCharactersStateCacheError extends FetchCharactersState {}
class FetchCharactersStateCacheEmpty extends FetchCharactersState {}
class FetchCharactersStateError extends FetchCharactersState {}
