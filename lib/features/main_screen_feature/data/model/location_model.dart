import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  final String name;
  final String url;

  const LocationModel({
    this.name = '',
    this.url = '',
  });

  factory LocationModel.fromJson(Map<String,dynamic> json) => _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
