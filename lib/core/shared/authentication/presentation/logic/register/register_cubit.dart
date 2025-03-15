import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/core/shared/authentication/data/models/client_register_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/login_response_model.dart';
import 'package:safety_frist/core/shared/authentication/data/repository/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;
  RegisterCubit(this._authRepository) : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late LoginResponseModel? userModel;

  void emitRegisterStates() async {
    emit(RegisterLoadingState());
    final response = await _authRepository.registerWithEmailPassword(
      ClientRegisterRequestBody(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
      ),
    );

    if (response is Success<LoginResponseModel>) {
      userModel = response.data;

      emit(RegisterSuccessState(loginResponseModel: userModel!));
    } else if (response is Failure<LoginResponseModel>) {
      emit(RegisterErrorState(message: response.error.message));
    }
  }
}
