// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProblemModel _$ProblemModelFromJson(Map<String, dynamic> json) => ProblemModel(
  description: json['description'] as String,
  problemTypeId: json['problemTypeId'] as String,
);

Map<String, dynamic> _$ProblemModelToJson(ProblemModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'problemTypeId': instance.problemTypeId,
    };
