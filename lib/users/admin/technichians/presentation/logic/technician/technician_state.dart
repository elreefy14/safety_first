abstract class TechnicianState {}

final class TechnicianInitialState extends TechnicianState {}

// Add Technician
final class AddTechnicianLoadingState extends TechnicianState {}

final class AddTechnicianSuccessState extends TechnicianState {}

final class AddTechnicianErrorState extends TechnicianState {
  final String error;

  AddTechnicianErrorState({required this.error});
}

// Update Technician
final class UpdateTechnicianLoadingState extends TechnicianState {}

final class UpdateTechnicianSuccessState extends TechnicianState {}

final class UpdateTechnicianErrorState extends TechnicianState {
  final String error;

  UpdateTechnicianErrorState({required this.error});
}

// Delete Technician
final class DeleteTechnicianLoadingState extends TechnicianState {}

final class DeleteTechnicianSuccessState extends TechnicianState {}

final class DeleteTechnicianErrorState extends TechnicianState {
  final String error;

  DeleteTechnicianErrorState({required this.error});
}

// Get Technician
final class GetTechnicianLoadingState extends TechnicianState {}

final class GetTechnicianSuccessState extends TechnicianState {}

final class GetTechnicianErrorState extends TechnicianState {
  final String error;

  GetTechnicianErrorState({required this.error});
}

// Get All Technician
final class GetAllTechniciansLoadingState extends TechnicianState {}

final class GetAllTechniciansSuccessState extends TechnicianState {}

final class GetAllTechniciansErrorState extends TechnicianState {
  final String error;

  GetAllTechniciansErrorState({required this.error});
}
