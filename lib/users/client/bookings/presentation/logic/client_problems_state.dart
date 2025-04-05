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

// Delete Problem By Id

final class DeleteProblemLoadingState extends ClientProblemsState {}

final class DeleteProblemSuccessState extends ClientProblemsState {}

final class DeleteProblemErrorState extends ClientProblemsState {
  final String error;

  DeleteProblemErrorState({required this.error});
}

// Update Problem

final class UpdateProblemLoadingState extends ClientProblemsState {}

final class UpdateProblemSuccessState extends ClientProblemsState {}

final class UpdateProblemErrorState extends ClientProblemsState {
  final String error;

  UpdateProblemErrorState({required this.error});
}

// Update Problem Status

final class UpdateProblemStatusLoadingState extends ClientProblemsState {}

final class UpdateProblemStatusSuccessState extends ClientProblemsState {}

final class UpdateProblemStatusErrorState extends ClientProblemsState {
  final String error;

  UpdateProblemStatusErrorState({required this.error});
}

// Update Problem Image

final class UpdateProblemImageLoadingState extends ClientProblemsState {}

final class UpdateProblemImageSuccessState extends ClientProblemsState {}

final class UpdateProblemImageErrorState extends ClientProblemsState {
  final String error;

  UpdateProblemImageErrorState({required this.error});
}

final class ImageSelectedSuccessState extends ClientProblemsState {}

final class ImageSelectedErrorState extends ClientProblemsState {}
