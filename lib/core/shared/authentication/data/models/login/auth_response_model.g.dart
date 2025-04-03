// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    AuthResponseModel(
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      email: json['Email'] as String?,
      accessToken: json['AccessToken'] as String?,
      refreshToken: json['RefreshToken'] as String?,
    );

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'Email': instance.email,
      'AccessToken': instance.accessToken,
      'RefreshToken': instance.refreshToken,
    };
