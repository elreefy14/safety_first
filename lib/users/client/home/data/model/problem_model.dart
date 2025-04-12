// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

part 'problem_model.g.dart';

@JsonSerializable()
class ProblemModel {
  @JsonKey(ignore: true)
  final File? imageFile;

  final String description;
  final String problemTypeId;

  ProblemModel({
    this.imageFile,
    required this.description,
    required this.problemTypeId,
  });

  Map<String, dynamic> toJson() => _$ProblemModelToJson(this);
}
