
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/info_entity.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/result_entity.dart';

class CharacterEntity {
  final InfoEntity info;
  final List<ResultEntity> results;

  CharacterEntity({
    this.info = const InfoEntity(),
    this.results = const [],
  });

}
