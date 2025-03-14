enum UserType { admin, client, technichian }

class UserTypeModel {
  final String image;
  final UserType userType;
  final String user;

  UserTypeModel({
    required this.image,
    required this.userType,
    required this.user,
  });
}
