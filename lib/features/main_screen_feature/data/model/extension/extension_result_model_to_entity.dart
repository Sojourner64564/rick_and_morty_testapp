import 'package:rick_and_morty_testapp/features/main_screen_feature/data/model/extension/extension_location_model_to_entity.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/data/model/result_model.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/result_entity.dart';

extension ResultModelExtension on ResultModel {
  ResultEntity toEntity() {
    return ResultEntity(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      origin: origin.toEntity(),
      location: location.toEntity(),
      image: image,
      episode: episode,
      url: url,
      created: created,
    );
  }
}