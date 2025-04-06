import 'package:rick_and_morty_testapp/features/main_screen_feature/data/model/location_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_model.g.dart';

@JsonSerializable()
class ResultModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationModel origin;
  final LocationModel location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  const ResultModel({
    this.id = 0,
    this.name = '',
    this.status = '',
    this.species = '',
    this.type = '',
    this.gender = '',
    this.origin = const LocationModel(),
    this.location = const LocationModel(),
    this.image = '',
    this.episode = const [],
    this.url = '',
    this.created = '',
  });

  factory ResultModel.fromJson(Map<String,dynamic> json) => _$ResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}