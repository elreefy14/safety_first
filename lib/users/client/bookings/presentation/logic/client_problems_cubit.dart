import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';
import 'package:safety_frist/users/client/bookings/data/repository/client_problems_repo.dart';

part 'client_problems_state.dart';

class ClientProblemsCubit extends Cubit<ClientProblemsState> {
  final ClientProblemsRepo _clientProblemsRepo;
  ClientProblemsCubit(this._clientProblemsRepo)
    : super(ClientProblemsInitial());

  static ClientProblemsCubit get(context) => BlocProvider.of(context);

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
}
