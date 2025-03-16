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

List<UserTypeModel> listUserType = [
  UserTypeModel(
    image: 'assets/images/the_client.svg',
    userType: UserType.client,
    user: 'عـميل',
  ),
  UserTypeModel(
    image: 'assets/images/the_manager.svg',
    userType: UserType.admin,
    user: 'مديـر',
  ),
  UserTypeModel(
    image: 'assets/images/the_technichian.svg',
    userType: UserType.technichian,
    user: 'فنـي',
  ),
];
