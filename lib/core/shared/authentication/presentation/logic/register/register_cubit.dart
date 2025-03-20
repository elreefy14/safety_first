import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/core/shared/authentication/data/models/auth/auth_response_model.dart';
import 'package:safety_frist/core/shared/authentication/data/models/auth/client_register_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/repository/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;
  RegisterCubit(this._authRepository) : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  late AuthResponseModel? userModel;

  void emitRegisterStates() async {
    emit(RegisterLoadingState());
    final response = await _authRepository.registerWithEmailPassword(
      ClientRegisterRequestBody(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    if (response is Success<AuthResponseModel>) {
      userModel = response.data;

      emit(RegisterSuccessState(authResponseModel: userModel!));
    } else if (response is Failure<AuthResponseModel>) {
      emit(RegisterErrorState(response.error.toString()));
    }
  }
}
