import 'package:json_annotation/json_annotation.dart';

part 'info_model.g.dart';

@JsonSerializable()
class InfoModel {
  final int count;
  final int pages;
  final String next;
  final String prev;

  const InfoModel({
    this.count = 0,
    this.pages = 0,
    this.next = '',
    this.prev = '',
  });

  factory InfoModel.fromJson(Map<String,dynamic> json) => _$InfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoModelToJson(this);
}
