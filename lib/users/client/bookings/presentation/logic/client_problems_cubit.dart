import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';
import 'package:safety_frist/users/client/bookings/data/models/update_problem_request_body.dart';
import 'package:safety_frist/users/client/bookings/data/repository/client_problems_repo.dart';

part 'client_problems_state.dart';

class ClientProblemsCubit extends Cubit<ClientProblemsState> {
  final ClientProblemsRepo _clientProblemsRepo;
  ClientProblemsCubit(this._clientProblemsRepo)
    : super(ClientProblemsInitial());

  static ClientProblemsCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey();

  List<ProblemResponseModel> clientProblems = [];

  Future<void> getClientProblems() async {
    final response = await _clientProblemsRepo.getClientProblems();

    if (response is Success<List<ProblemResponseModel>>) {
      clientProblems = response.data;
      emit(GetClientProblemSuccessState());
    } else {
      emit(GetClientProblemErrorState());
    }
  }

  ProblemResponseModel? problemResponseModel;

  Future<void> getProblemById({required String problemId}) async {
    emit(GetProblemByIdLoadingState());
    final response = await _clientProblemsRepo.getProblemById(problemId);

    if (response is Success<ProblemResponseModel>) {
      problemResponseModel = response.data;
      emit(GetProblemByIdSuccessState());
    } else if (response is Failure) {
      emit(GetProblemByIdErrorState(error: response.toString()));
    }
  }

  Future<void> deleteProblem({required String problemId}) async {
    emit(DeleteProblemLoadingState());
    final response = await _clientProblemsRepo.deleteProblem(problemId);

    if (response is Success) {
      getClientProblems();
      emit(DeleteProblemSuccessState());
    } else if (response is Failure) {
      emit(DeleteProblemErrorState(error: response.toString()));
    }
  }

  Future<void> updateProblem({
    required String problemId,
    required description,
  }) async {
    emit(UpdateProblemLoadingState());
    final response = await _clientProblemsRepo.updateProblem(
      problemId,
      UpdateProblemRequestBody(
        description: description,
        type: problemResponseModel!.type,
      ),
    );

    if (response is Success) {
      getClientProblems();
      emit(UpdateProblemSuccessState());
    } else if (response is Failure) {
      emit(UpdateProblemErrorState(error: response.toString()));
    }
  }
}
