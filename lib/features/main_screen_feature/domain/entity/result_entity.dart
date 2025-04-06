import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/location_entity.dart';

class ResultEntity {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationEntity origin;
  final LocationEntity location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  const ResultEntity({
    this.id = 0,
    this.name = '',
    this.status = '',
    this.species = '',
    this.type = '',
    this.gender = '',
    this.origin = const LocationEntity(),
    this.location = const LocationEntity(),
    this.image = '',
    this.episode = const [],
    this.url = '',
    this.created = '',
  });
}