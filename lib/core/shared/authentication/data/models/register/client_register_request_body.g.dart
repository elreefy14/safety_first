// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_register_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientRegisterRequestBody _$ClientRegisterRequestBodyFromJson(
  Map<String, dynamic> json,
) => ClientRegisterRequestBody(
  firstName: json['FirstName'] as String?,
  lastName: json['LastName'] as String?,
  email: json['Email'] as String?,
  password: json['Password'] as String?,
);

Map<String, dynamic> _$ClientRegisterRequestBodyToJson(
  ClientRegisterRequestBody instance,
) => <String, dynamic>{
  'FirstName': instance.firstName,
  'LastName': instance.lastName,
  'Email': instance.email,
  'Password': instance.password,
};
