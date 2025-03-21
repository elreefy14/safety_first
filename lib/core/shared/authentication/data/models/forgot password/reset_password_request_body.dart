class ResetPasswordRequestBody {
  ResetPasswordRequestBody({
    required this.email,
    required this.token,
    required this.newPassword,
  });

  final String? email;
  final String? token;
  final String? newPassword;

  factory ResetPasswordRequestBody.fromJson(Map<String, dynamic> json) {
    return ResetPasswordRequestBody(
      email: json["email"],
      token: json["token"],
      newPassword: json["newPassword"],
    );
  }

  Map<String, dynamic> toJson() => {
    "email": email,
    "token": token,
    "newPassword": newPassword,
  };
}
