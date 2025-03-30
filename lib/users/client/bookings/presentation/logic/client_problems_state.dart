part of 'client_problems_cubit.dart';

@immutable
sealed class ClientProblemsState {}

final class ClientProblemsInitial extends ClientProblemsState {}

final class GetClientProblemSuccessState extends ClientProblemsState {}

final class GetClientProblemErrorState extends ClientProblemsState {}
