part of 'fetch_characters_cubit.dart';

@immutable
abstract class FetchCharactersState {}

class FetchCharactersStateInitial extends FetchCharactersState {}
class FetchCharactersStateLoading extends FetchCharactersState {}
class FetchCharactersStateLoaded extends FetchCharactersState {}
class FetchCharactersStateError extends FetchCharactersState {}
