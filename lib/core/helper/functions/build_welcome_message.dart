import 'package:safety_frist/core/shared/authentication/data/models/user_type_model.dart';
import 'package:safety_frist/core/shared/authentication/data/models/welcome_message_model.dart';

WelcomeMessage buildWelcomeMessage(UserType userType) {
  if (userType == UserType.client) {
    return listWelcomeMessage[0];
  } else if (userType == UserType.admin) {
    return listWelcomeMessage[1];
  } else {
    return listWelcomeMessage[2];
  }
}
