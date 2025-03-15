import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/core/shared/authentication/data/models/login_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/login_response_model.dart';
import 'package:safety_frist/core/shared/authentication/data/repository/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginCubit(this._authRepository) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  late LoginResponseModel? userModel;

  void emitLoginStates() async {
    emit(LoginLoadingState());
    ApiResult<LoginResponseModel> response = await _authRepository
        .loginWithEmailPassword(
          LoginRequestBody(
            email: emailController.text,
            password: passwordController.text,
          ),
        );

    if (response is Success<LoginResponseModel>) {
      userModel = response.data;

      emit(LoginSuccessState(loginResponseModel: userModel!));
    } else if (response is Failure<LoginResponseModel>) {
      emit(LoginErrorState(message: response.error.message));
    }
  }
}
