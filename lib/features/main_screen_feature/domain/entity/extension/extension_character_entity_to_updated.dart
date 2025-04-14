import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/character_entity.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/result_entity.dart';

/// Экстеншн который в существующtv Entity заменяет новым экземпляр InfoEntity и пополняет список ResultEntity entity из newCharacterEntity
extension ExtensionCharacterEntityToUpdated on CharacterEntity{
  CharacterEntity updatedWith(CharacterEntity newCharacterEntity){
    return CharacterEntity(
      info: newCharacterEntity.info,
      results: List<ResultEntity>.from(results)..addAll(newCharacterEntity.results)
    );
  }

}