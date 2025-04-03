import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/admin/technichians/data/models/add_engineer_request_body.dart';
import 'package:safety_frist/users/admin/technichians/data/models/engineer_response_model.dart';

import 'package:safety_frist/users/admin/technichians/data/repository/engineer_repository.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/engineer/engineer_state.dart';

class EngineerCubit extends Cubit<EngineerState> {
  final EngineerRepository _repository;
  EngineerCubit(this._repository) : super(EngineerInitialState());

  static EngineerCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  Future<void> addEngineer() async {
    emit(AddEngineerLoadingState());
    final response = await _repository.addEngineer(
      AddEngineerRequestBody(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    if (response is Success) {
      emit(AddEngineerSuccessState());
    } else if (response is Failure) {
      emit(AddEngineerErrorState(error: response.error.toString()));
    }
  }

  Future<void> updateEngineer({required String id}) async {
    emit(UpdateEngineerLoadingState());
    final response = await _repository.updateEngineer(
      AddEngineerRequestBody(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
      id,
    );

    if (response is Success) {
      emit(UpdateEngineerSuccessState());
    } else if (response is Failure) {
      emit(UpdateEngineerErrorState(error: response.error.toString()));
    }
  }

  Future<void> deleteEngineer({required String id}) async {
    emit(DeleteEngineerLoadingState());
    final response = await _repository.deleteEngineer(id);

    if (response is Success) {
      emit(DeleteEngineerSuccessState());
    } else if (response is Failure) {
      emit(DeleteEngineerErrorState(error: response.error.toString()));
    }
  }

  Future<void> getEngineer({required String id}) async {
    emit(GetEngineerLoadingState());
    final response = await _repository.getEngineer(id);

    if (response is Success) {
      emit(GetEngineerSuccessState());
    } else if (response is Failure) {
      emit(GetEngineerErrorState(error: response.toString()));
    }
  }

  List<EngineerResponseModel> allEngineersList = [];

  Future<void> getAllEngineers() async {
    emit(GetAllEngineersLoadingState());
    final response = await _repository.getAllEngineers();

    if (response is Success<List<EngineerResponseModel>>) {
      allEngineersList = response.data;
      emit(GetAllEngineersSuccessState());
    } else if (response is Failure) {
      emit(GetAllEngineersErrorState(error: response.toString()));
    }
  }
}
