import 'dart:io';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'problem_model.g.dart';

@JsonSerializable()
class ProblemModel {
  @JsonKey(ignore: true) // لأن الصورة سترفع كـ Multipart
  final File? imageFile;

  final String description;
  final int type;

  ProblemModel({
    this.imageFile,
    required this.description,
    required this.type,
  });

  Map<String, dynamic> toJson() => _$ProblemModelToJson(this);

  factory ProblemModel.fromJson(Map<String, dynamic> json) =>
      _$ProblemModelFromJson(json);
}
