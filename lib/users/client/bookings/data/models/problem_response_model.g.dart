// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProblemResponseModel _$ProblemResponseModelFromJson(
  Map<String, dynamic> json,
) => ProblemResponseModel(
  id: json['Id'] as String?,
  imageUrl: json['ImageUrl'] as String?,
  description: json['Description'] as String?,
  status: (json['Status'] as num?)?.toInt(),
  clientId: json['ClientId'] as String?,
  clientName: json['ClientName'] as String?,
  technicianId: json['TechnicianId'],
  technicianName: json['TechnicianName'] as String?,
  problemTypeId: json['ProblemTypeId'] as String?,
  problemTypeName: json['ProblemTypeName'] as String?,
);
