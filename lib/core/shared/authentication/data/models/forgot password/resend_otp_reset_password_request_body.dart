class ResendOtpResetPasswordRequestBody {
  ResendOtpResetPasswordRequestBody({required this.email});

  final String? email;

  factory ResendOtpResetPasswordRequestBody.fromJson(
    Map<String, dynamic> json,
  ) {
    return ResendOtpResetPasswordRequestBody(email: json["Email"]);
  }

  Map<String, dynamic> toJson() => {"Email": email};
}
