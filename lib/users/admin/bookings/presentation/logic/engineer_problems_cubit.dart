import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/admin/bookings/data/repository/engineer_problems_repository.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/engineer_problems_state.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';

class EngineerProblemsCubit extends Cubit<EngineerProblemsState> {
  final EngineerProblemsRepository _repository;
  EngineerProblemsCubit(this._repository)
    : super(EngineerProblemsInitialState());

  static EngineerProblemsCubit get(context) => BlocProvider.of(context);

  List<ProblemResponseModel> allProblemsList = [];
  Future<void> getAllProblems() async {
    emit(GetProblemsLoadingState());
    final response = await _repository.getAllProblems();

    if (response is Success<List<ProblemResponseModel>>) {
      allProblemsList = response.data;
      emit(GetProblemsSuccessState());
    } else if (response is Failure) {
      emit(GetProblemsErrorState(error: response.toString()));
    }
  }

  ProblemResponseModel? problemResponseModel;

  Future<void> getProblemById({required String problemId}) async {
    emit(GetProblemByIdLoadingState());
    final response = await _repository.getProblemById(problemId);

    if (response is Success<ProblemResponseModel>) {
      problemResponseModel = response.data;
      emit(GetProblemByIdSuccessState());
    } else if (response is Failure) {
      emit(GetProblemByIdErrorState(error: response.toString()));
    }
  }

  Future<void> getProblemsByStatus({required int statusId}) async {
    emit(GetProblemsLoadingState());
    final response = await _repository.getProblemByStatus(statusId);

    if (response is Success<List<ProblemResponseModel>>) {
      allProblemsList = response.data;
      emit(GetProblemsSuccessState());
    } else if (response is Failure) {
      emit(GetProblemsErrorState(error: response.toString()));
    }
  }

  Future<void> assignProblemToTechnician({
    required String problemId,
    required String technicianId,
  }) async {
    emit(AssignProblemToTechnicianLoadingState());
    final response = await _repository.assignProblemToTechnician(
      problemId,
      technicianId,
    );

    if (response is Success) {
      emit(AssignProblemToTechnicianSuccessState());
    } else if (response is Failure) {
      emit(AssignProblemToTechnicianErrorState(error: response.toString()));
    }
  }
}
