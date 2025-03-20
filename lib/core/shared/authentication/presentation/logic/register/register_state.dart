part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterErrorState extends RegisterState {
  final String? message;

  RegisterErrorState(this.message);
}

final class RegisterSuccessState extends RegisterState {
  final AuthResponseModel authResponseModel;

  RegisterSuccessState({required this.authResponseModel});
}
