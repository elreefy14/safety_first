abstract class EngineerState {}

final class EngineerInitialState extends EngineerState {}

// Add Engineer
final class AddEngineerLoadingState extends EngineerState {}

final class AddEngineerSuccessState extends EngineerState {}

final class AddEngineerErrorState extends EngineerState {
  final String error;

  AddEngineerErrorState({required this.error});
}

// Update Engineer
final class UpdateEngineerLoadingState extends EngineerState {}

final class UpdateEngineerSuccessState extends EngineerState {}

final class UpdateEngineerErrorState extends EngineerState {
  final String error;

  UpdateEngineerErrorState({required this.error});
}

// Delete Engineer
final class DeleteEngineerLoadingState extends EngineerState {}

final class DeleteEngineerSuccessState extends EngineerState {}

final class DeleteEngineerErrorState extends EngineerState {
  final String error;

  DeleteEngineerErrorState({required this.error});
}

// Get Engineer
final class GetEngineerLoadingState extends EngineerState {}

final class GetEngineerSuccessState extends EngineerState {}

final class GetEngineerErrorState extends EngineerState {
  final String error;

  GetEngineerErrorState({required this.error});
}

// Get All Engineer
final class GetAllEngineersLoadingState extends EngineerState {}

final class GetAllEngineersSuccessState extends EngineerState {}

final class GetAllEngineersErrorState extends EngineerState {
  final String error;

  GetAllEngineersErrorState({required this.error});
}
