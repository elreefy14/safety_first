abstract class ProblemTypeState {}

final class ProblemTypeInitialState extends ProblemTypeState {}

// Add ProblemType
final class AddProblemTypeLoadingState extends ProblemTypeState {}

final class AddProblemTypeSuccessState extends ProblemTypeState {}

final class AddProblemTypeErrorState extends ProblemTypeState {
  final String error;

  AddProblemTypeErrorState({required this.error});
}

// Update ProblemType
final class UpdateProblemTypeLoadingState extends ProblemTypeState {}

final class UpdateProblemTypeSuccessState extends ProblemTypeState {}

final class UpdateProblemTypeErrorState extends ProblemTypeState {
  final String error;

  UpdateProblemTypeErrorState({required this.error});
}

// Delete ProblemType
final class DeleteProblemTypeLoadingState extends ProblemTypeState {}

final class DeleteProblemTypeSuccessState extends ProblemTypeState {}

final class DeleteProblemTypeErrorState extends ProblemTypeState {
  final String error;

  DeleteProblemTypeErrorState({required this.error});
}

// Get ProblemType
final class GetProblemTypeLoadingState extends ProblemTypeState {}

final class GetProblemTypeSuccessState extends ProblemTypeState {}

final class GetProblemTypeErrorState extends ProblemTypeState {
  final String error;

  GetProblemTypeErrorState({required this.error});
}

// Get All ProblemType
final class GetAllProblemTypesLoadingState extends ProblemTypeState {}

final class GetAllProblemTypesSuccessState extends ProblemTypeState {}

final class GetAllProblemTypesErrorState extends ProblemTypeState {
  final String error;

  GetAllProblemTypesErrorState({required this.error});
}
