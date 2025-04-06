import 'package:rick_and_morty_testapp/features/main_screen_feature/data/model/character_model.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/data/model/extension/extension_info_model_to_entity.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/data/model/extension/extension_result_model_to_entity.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/character_entity.dart';

extension ExtensionCharacterModelToEntity on CharacterModel{
  CharacterEntity toEntity(){
    return CharacterEntity(
      info: info.toEntity(),
        results: results.map((value)=>value.toEntity()).toList(),
    );
  }
}