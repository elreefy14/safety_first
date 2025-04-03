import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/admin/technichians/data/models/add_technician_request_body.dart';
import 'package:safety_frist/users/admin/technichians/data/models/technician_response_model.dart';

import 'package:safety_frist/users/admin/technichians/data/repository/technician_repository.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/technician/technician_state.dart';

class TechnicianCubit extends Cubit<TechnicianState> {
  final TechnicianRepository _repository;
  TechnicianCubit(this._repository) : super(TechnicianInitialState());

  static TechnicianCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  Future<void> addTechnician() async {
    emit(AddTechnicianLoadingState());
    final response = await _repository.addTechnician(
      AddTechnicianRequestBody(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    if (response is Success) {
      emit(AddTechnicianSuccessState());
    } else if (response is Failure) {
      emit(AddTechnicianErrorState(error: response.error.toString()));
    }
  }

  Future<void> updateTechnician({required String id}) async {
    emit(UpdateTechnicianLoadingState());
    final response = await _repository.updateTechnician(
      AddTechnicianRequestBody(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
      id,
    );

    if (response is Success) {
      emit(UpdateTechnicianSuccessState());
    } else if (response is Failure) {
      emit(UpdateTechnicianErrorState(error: response.error.toString()));
    }
  }

  Future<void> deleteTechnician({required String id}) async {
    emit(DeleteTechnicianLoadingState());
    final response = await _repository.deleteTechnician(id);

    if (response is Success) {
      emit(DeleteTechnicianSuccessState());
    } else if (response is Failure) {
      emit(DeleteTechnicianErrorState(error: response.error.toString()));
    }
  }

  Future<void> getTechnician({required String id}) async {
    emit(GetTechnicianLoadingState());
    final response = await _repository.getTechnician(id);

    if (response is Success) {
      emit(GetTechnicianSuccessState());
    } else if (response is Failure) {
      emit(GetTechnicianErrorState(error: response.toString()));
    }
  }

  List<TechnicianResponseModel> allTechniciansList = [];

  Future<void> getAllTechnicians() async {
    emit(GetAllTechniciansLoadingState());
    final response = await _repository.getAllTechnicians();

    if (response is Success<List<TechnicianResponseModel>>) {
      allTechniciansList = response.data;
      emit(GetAllTechniciansSuccessState());
    } else if (response is Failure) {
      emit(GetAllTechniciansErrorState(error: response.toString()));
    }
  }
}
