import 'package:json_annotation/json_annotation.dart';

part 'problem_response_model.g.dart';

@JsonSerializable(createToJson: false)
class ProblemResponseModel {
  ProblemResponseModel({
    required this.id,
    required this.imageUrl,
    required this.description,
    required this.status,
    required this.clientId,
    required this.clientName,
    required this.technicianId,
    required this.technicianName,
    required this.type,
  });

  @JsonKey(name: 'Id')
  final String? id;

  @JsonKey(name: 'ImageUrl')
  final String? imageUrl;

  @JsonKey(name: 'Description')
  final String? description;

  @JsonKey(name: 'Status')
  final int? status;

  @JsonKey(name: 'ClientId')
  final String? clientId;

  @JsonKey(name: 'ClientName')
  final String? clientName;

  @JsonKey(name: 'TechnicianId')
  final dynamic technicianId;

  @JsonKey(name: 'TechnicianName')
  final String? technicianName;

  @JsonKey(name: 'Type')
  final int? type;

  factory ProblemResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProblemResponseModelFromJson(json);
}
