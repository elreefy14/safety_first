import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/core/shared/authentication/data/models/forgot%20password/forgot_password_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/repository/auth_repository.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository _authRepository;
  ForgotPasswordCubit(this._authRepository)
    : super(ForgotPasswordInitialState());

  static ForgotPasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  void emitForgotPasswordStates() async {
    emit(ForgotPasswordLoadingState());
    final response = await _authRepository.forgotPassword(
      ForgotPasswordRequestBody(email: emailController.text),
    );

    if (response is Success) {
      emit(
        ForgotPasswordSuccessState(
          message: 'تم إرسال لينك إلي الإيميل لإعادة تعيين كلمة المرور',
        ),
      );
    } else if (response is Failure) {
      emit(ForgotPasswordErrorState(message: response.error.toString()));
    }
  }
}
