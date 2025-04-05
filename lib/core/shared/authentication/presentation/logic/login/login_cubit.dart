import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/cache/shared_pref_helper.dart';
import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/core/shared/authentication/data/models/login/auth_response_model.dart';
import 'package:safety_frist/core/shared/authentication/data/models/login/login_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/forgot%20password/forgot_password_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/repository/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginCubit(this._authRepository) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  late AuthResponseModel? userModel;

  void emitLoginStates() async {
    emit(LoginLoadingState());
    final response = await _authRepository.loginWithEmailPassword(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    if (response is Success<AuthResponseModel>) {
      userModel = response.data;
      saveUserToken(response.data.accessToken!);
      emit(LoginSuccessState(authResponseModel: userModel!));
    } else if (response is Failure) {
      emit(
        LoginErrorState(message: ApiErrorHandler.handleError(response).message),
      );
    }
  }

  void emitForgotPasswordStates() async {
    emit(LoginLoadingState());
    final response = await _authRepository.forgotPassword(
      ForgotPasswordRequestBody(email: emailController.text),
    );

    if (response is Success) {
      emit(LoginSuccessState(authResponseModel: userModel!));
    } else if (response is Failure) {
      emit(LoginErrorState(message: response.error.toString()));
    }
  }

  saveUserToken(String token) {
    CacheHelper.saveData(key: 'token', value: token);
  }
}
