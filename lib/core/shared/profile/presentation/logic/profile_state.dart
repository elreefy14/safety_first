import 'package:safety_frist/core/shared/profile/data/models/logout_response_model.dart';
import 'package:safety_frist/core/shared/profile/data/models/profile_response_model.dart';

abstract class ProfileState {}

final class InitialProfileState extends ProfileState {}

/// GET PROFILE DATA

final class GetProfileLoadingState extends ProfileState {}

final class GetProfileSuccessState extends ProfileState {
  final ProfileResponseModel profileResponseModel;

  GetProfileSuccessState({required this.profileResponseModel});
}

final class GetProfileErrorState extends ProfileState {
  final String message;

  GetProfileErrorState({required this.message});
}

/// LOGOUT PROFILE DATA

final class LogoutUserLoadingState extends ProfileState {}

final class LogoutUserSuccessState extends ProfileState {
  final LogoutResponseModel logoutResponseModel;

  LogoutUserSuccessState({required this.logoutResponseModel});
}

final class LogoutUserErrorState extends ProfileState {
  final String message;

  LogoutUserErrorState({required this.message});
}
