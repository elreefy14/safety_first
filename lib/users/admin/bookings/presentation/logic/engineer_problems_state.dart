abstract class EngineerProblemsState {}

final class EngineerProblemsInitialState extends EngineerProblemsState {}

// Get All Problems

final class GetProblemsLoadingState extends EngineerProblemsState {}

final class GetProblemsSuccessState extends EngineerProblemsState {}

final class GetProblemsErrorState extends EngineerProblemsState {
  final String error;

  GetProblemsErrorState({required this.error});
}

// Get Problem By Id

final class GetProblemByIdLoadingState extends EngineerProblemsState {}

final class GetProblemByIdSuccessState extends EngineerProblemsState {}

final class GetProblemByIdErrorState extends EngineerProblemsState {
  final String error;

  GetProblemByIdErrorState({required this.error});
}

// Assign Problem To Technician

final class AssignProblemToTechnicianLoadingState
    extends EngineerProblemsState {}

final class AssignProblemToTechnicianSuccessState
    extends EngineerProblemsState {}

final class AssignProblemToTechnicianErrorState extends EngineerProblemsState {
  final String error;

  AssignProblemToTechnicianErrorState({required this.error});
}
