import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponseModel {
  final String id;
  final String email;
  final String role;
  final String token;
  final int expiresIn;
  final String refreshToken;
  final DateTime refreshTokenExpiration;

  LoginResponseModel({
    required this.id,
    required this.email,
    required this.role,
    required this.token,
    required this.expiresIn,
    required this.refreshToken,
    required this.refreshTokenExpiration,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
