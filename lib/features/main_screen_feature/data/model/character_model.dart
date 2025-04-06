import 'package:rick_and_morty_testapp/features/main_screen_feature/data/model/info_model.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/data/model/result_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  final InfoModel info;
  final List<ResultModel> results;

  CharacterModel({
     this.info = const InfoModel(),
     this.results = const [],
  });

  factory CharacterModel.fromJson(Map<String,dynamic> json) => _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
