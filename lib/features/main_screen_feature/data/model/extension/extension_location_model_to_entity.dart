import 'package:rick_and_morty_testapp/features/main_screen_feature/data/model/location_model.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/location_entity.dart';

extension ExtensionLocationModelToEntity on LocationModel{
  LocationEntity toEntity(){
    return LocationEntity(
      name: name,
      url: url,
    );
  }
}