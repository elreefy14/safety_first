import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';

@JsonSerializable(createToJson: false)
class ProfileResponseModel {
  ProfileResponseModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  @JsonKey(name: 'Id')
  final String? id;

  @JsonKey(name: 'FirstName')
  final String? firstName;

  @JsonKey(name: 'LastName')
  final String? lastName;

  @JsonKey(name: 'Email')
  final String? email;

  @JsonKey(name: 'PhoneNumber')
  final dynamic phoneNumber;

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);
}
