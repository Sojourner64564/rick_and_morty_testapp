import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_testapp/core/error/failure.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/character_entity.dart';

abstract class FetchCharactersRepository{
  Future<CharacterEntity> fetchCharacters();
}