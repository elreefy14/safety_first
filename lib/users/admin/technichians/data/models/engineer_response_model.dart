class EngineerResponseModel {
  EngineerResponseModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final dynamic phoneNumber;

  factory EngineerResponseModel.fromJson(Map<String, dynamic> json) {
    return EngineerResponseModel(
      id: json["Id"],
      firstName: json["FirstName"],
      lastName: json["LastName"],
      email: json["Email"],
      phoneNumber: json["PhoneNumber"],
    );
  }
}
