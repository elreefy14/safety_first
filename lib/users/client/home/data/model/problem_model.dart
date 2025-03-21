// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

part 'problem_model.g.dart';

@JsonSerializable()
class ProblemModel {
  @JsonKey(ignore: true)
  final File? imageFile;

  final String description;
  final int type;

  ProblemModel({this.imageFile, required this.description, required this.type});

  Map<String, dynamic> toJson() => _$ProblemModelToJson(this);

  factory ProblemModel.fromJson(Map<String, dynamic> json) =>
      _$ProblemModelFromJson(json);
}
