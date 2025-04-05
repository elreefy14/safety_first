sealed class TechnicianProblemsState {}

final class TechnicianProblemsInitialState extends TechnicianProblemsState {}

// Get Technician Problems

final class GetTechnicianProblemLoadingState extends TechnicianProblemsState {}

final class GetTechnicianProblemSuccessState extends TechnicianProblemsState {}

final class GetTechnicianProblemErrorState extends TechnicianProblemsState {
  final String error;

  GetTechnicianProblemErrorState({required this.error});
}

// Get Problem By Id

final class GetProblemByIdLoadingState extends TechnicianProblemsState {}

final class GetProblemByIdSuccessState extends TechnicianProblemsState {}

final class GetProblemByIdErrorState extends TechnicianProblemsState {
  final String error;

  GetProblemByIdErrorState({required this.error});
}

final class DeleteProblemLoadingState extends TechnicianProblemsState {}

final class DeleteProblemSuccessState extends TechnicianProblemsState {}

final class DeleteProblemErrorState extends TechnicianProblemsState {
  final String error;

  DeleteProblemErrorState({required this.error});
}

// Update Problem

final class UpdateProblemLoadingState extends TechnicianProblemsState {}

final class UpdateProblemSuccessState extends TechnicianProblemsState {}

final class UpdateProblemErrorState extends TechnicianProblemsState {
  final String error;

  UpdateProblemErrorState({required this.error});
}

// Update Problem Status

final class UpdateProblemStatusLoadingState extends TechnicianProblemsState {}

final class UpdateProblemStatusSuccessState extends TechnicianProblemsState {}

final class UpdateProblemStatusErrorState extends TechnicianProblemsState {
  final String error;

  UpdateProblemStatusErrorState({required this.error});
}

// Update Problem Image

final class UpdateProblemImageLoadingState extends TechnicianProblemsState {}

final class UpdateProblemImageSuccessState extends TechnicianProblemsState {}

final class UpdateProblemImageErrorState extends TechnicianProblemsState {
  final String error;

  UpdateProblemImageErrorState({required this.error});
}

final class ImageSelectedSuccessState extends TechnicianProblemsState {}

final class ImageSelectedErrorState extends TechnicianProblemsState {}
