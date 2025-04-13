import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/admin/bookings/data/models/problem_type_request_body.dart';
import 'package:safety_frist/users/admin/bookings/data/models/problem_type_response_model.dart';
import 'package:safety_frist/users/admin/bookings/data/repository/engineer_problem_type_repository.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/problem%20type/problem_type_state.dart';

class ProblemTypeCubit extends Cubit<ProblemTypeState> {
  final EngineerProblemTypeRepository _repository;
  ProblemTypeCubit(this._repository) : super(ProblemTypeInitialState());

  static ProblemTypeCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> addFormKey = GlobalKey();
  GlobalKey<FormState> updateFormKey = GlobalKey();
  TextEditingController nameTypeController = TextEditingController();
  TextEditingController updateNameTypeController = TextEditingController();

  Future<void> addProblemType() async {
    emit(AddProblemTypeLoadingState());
    final response = await _repository.addProblemType(
      ProblemTypeRequestBody(name: nameTypeController.text),
    );

    if (response is Success) {
      getAllProblemTypes();
      emit(AddProblemTypeSuccessState());
    } else if (response is Failure) {
      emit(AddProblemTypeErrorState(error: response.error.toString()));
    }
  }

  Future<void> updateProblemType({required String id}) async {
    emit(UpdateProblemTypeLoadingState());
    final response = await _repository.updateProblemType(
      ProblemTypeRequestBody(name: updateNameTypeController.text),
      id,
    );

    if (response is Success) {
      getAllProblemTypes();
      emit(UpdateProblemTypeSuccessState());
    } else if (response is Failure) {
      emit(UpdateProblemTypeErrorState(error: response.error.toString()));
    }
  }

  Future<void> deleteProblemType({required String id}) async {
    emit(DeleteProblemTypeLoadingState());
    final response = await _repository.deleteProblemType(id);

    if (response is Success) {
      getAllProblemTypes();
      emit(DeleteProblemTypeSuccessState());
    } else if (response is Failure) {
      emit(DeleteProblemTypeErrorState(error: response.error.toString()));
    }
  }

  Future<void> getProblemType({required String id}) async {
    emit(GetProblemTypeLoadingState());
    final response = await _repository.getProblemTypesById(id);

    if (response is Success) {
      emit(GetProblemTypeSuccessState());
    } else if (response is Failure) {
      emit(GetProblemTypeErrorState(error: response.toString()));
    }
  }

  List<ProblemTypeResponseModel> allProblemTypesList = [];

  Future<void> getAllProblemTypes() async {
    emit(GetAllProblemTypesLoadingState());
    final response = await _repository.getAllProblemTypes();

    if (response is Success<List<ProblemTypeResponseModel>>) {
      allProblemTypesList = response.data;
      emit(GetAllProblemTypesSuccessState());
    } else if (response is Failure) {
      emit(GetAllProblemTypesErrorState(error: response.toString()));
    }
  }
}
