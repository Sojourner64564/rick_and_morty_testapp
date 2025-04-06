import 'package:rick_and_morty_testapp/features/main_screen_feature/data/model/info_model.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/info_entity.dart';

extension ExtensionInfoModelToEntity on InfoModel {
  InfoEntity toEntity() {
    return InfoEntity(
      count: count,
      pages: pages,
      next: next,
      prev: prev,
    );
  }
}
