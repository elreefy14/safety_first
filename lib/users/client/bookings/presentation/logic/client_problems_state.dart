part of 'client_problems_cubit.dart';

@immutable
sealed class ClientProblemsState {}

final class ClientProblemsInitial extends ClientProblemsState {}

final class GetClientProblemSuccessState extends ClientProblemsState {}

final class GetClientProblemErrorState extends ClientProblemsState {}

// Get Problem By Id

final class GetProblemByIdLoadingState extends ClientProblemsState {}

final class GetProblemByIdSuccessState extends ClientProblemsState {}

final class GetProblemByIdErrorState extends ClientProblemsState {
  final String error;

  GetProblemByIdErrorState({required this.error});
}

// Get Problem By Id

final class DeleteProblemLoadingState extends ClientProblemsState {}

final class DeleteProblemSuccessState extends ClientProblemsState {}

final class DeleteProblemErrorState extends ClientProblemsState {
  final String error;

  DeleteProblemErrorState({required this.error});
}

// Get Problem By Id

final class UpdateProblemLoadingState extends ClientProblemsState {}

final class UpdateProblemSuccessState extends ClientProblemsState {}

final class UpdateProblemErrorState extends ClientProblemsState {
  final String error;

  UpdateProblemErrorState({required this.error});
}
