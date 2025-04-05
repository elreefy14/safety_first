import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';
import 'package:safety_frist/users/tech/data/repo/technician_problems_repository.dart';
import 'package:safety_frist/users/tech/presentation/logic/technician_problems_state.dart';

class TechnicianProblemsCubit extends Cubit<TechnicianProblemsState> {
  final TechnicianProblemsRepository _problemsRepository;
  TechnicianProblemsCubit(this._problemsRepository)
    : super(TechnicianProblemsInitialState());

  static TechnicianProblemsCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey();

  List<ProblemResponseModel> technicianProblems = [];

  Future<void> getTechnicianProblems() async {
    emit(GetTechnicianProblemLoadingState());

    final response = await _problemsRepository.getTechnicianProblems();

    if (response is Success<List<ProblemResponseModel>>) {
      technicianProblems = response.data;
      emit(GetTechnicianProblemSuccessState());
    } else if (response is Failure) {
      emit(GetTechnicianProblemErrorState(error: response.toString()));
    }
  }

  ProblemResponseModel? problemResponseModel;

  Future<void> getProblemById({required String problemId}) async {
    emit(GetProblemByIdLoadingState());
    final response = await _problemsRepository.getProblemById(problemId);

    if (response is Success<ProblemResponseModel>) {
      problemResponseModel = response.data;
      emit(GetProblemByIdSuccessState());
    } else if (response is Failure) {
      emit(GetProblemByIdErrorState(error: response.toString()));
    }
  }

  Future<void> deleteProblem({required String problemId}) async {
    emit(DeleteProblemLoadingState());
    final response = await _problemsRepository.deleteProblem(problemId);

    if (response is Success) {
      getTechnicianProblems();
      emit(DeleteProblemSuccessState());
    } else if (response is Failure) {
      emit(DeleteProblemErrorState(error: response.toString()));
    }
  }

  Future<void> updateProblemStatus({required String problemId}) async {
    emit(UpdateProblemStatusLoadingState());
    final response = await _problemsRepository.updateProblemStatus(
      problemId,
      2,
    );

    if (response is Success) {
      getTechnicianProblems();
      emit(UpdateProblemStatusSuccessState());
    } else if (response is Failure) {
      emit(UpdateProblemStatusErrorState(error: response.toString()));
    }
  }
}
