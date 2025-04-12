import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/core/shared/profile/data/models/logout_response_model.dart';
import 'package:safety_frist/core/shared/profile/data/models/profile_response_model.dart';
import 'package:safety_frist/core/shared/profile/data/repository/profile_repository.dart';
import 'package:safety_frist/core/shared/profile/presentation/logic/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository;
  ProfileCubit(this._profileRepository) : super(InitialProfileState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  ProfileResponseModel? userModel;
  LogoutResponseModel? logoutModel;

  // Get Profile Data

  void getProfileDate() async {
    emit(GetProfileLoadingState());

    final response = await _profileRepository.getProfile();
    if (response is Success<ProfileResponseModel>) {
      userModel = response.data;

      emit(GetProfileSuccessState(profileResponseModel: userModel!));
    } else {
      emit(GetProfileErrorState(message: 'Your Info is not found'));
    }
  }

  // LOGOUT

  void logoutUser() async {
    emit(LogoutUserLoadingState());

    final response = await _profileRepository.logoutUser();
    if (response is Success<LogoutResponseModel>) {
      emit(LogoutUserSuccessState(logoutResponseModel: response.data));
    } else {
      emit(LogoutUserErrorState(message: 'Can not log out'));
    }
  }
}
