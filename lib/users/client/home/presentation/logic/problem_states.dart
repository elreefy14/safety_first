import 'package:flutter/cupertino.dart';

@immutable
sealed class ProblemState {}

class ProblemInitial extends ProblemState {}

class ProblemLoading extends ProblemState {}

class ProblemSuccess extends ProblemState {
  ProblemSuccess();
}

class ProblemFailure extends ProblemState {
  final String error;
  ProblemFailure(this.error);
}

final class ImageSelectedSuccessState extends ProblemState {}

final class ImageSelectedErrorState extends ProblemState {}

// Get All ProblemType
final class GetAllProblemTypesLoadingState extends ProblemState {}

final class GetAllProblemTypesSuccessState extends ProblemState {}

final class GetAllProblemTypesErrorState extends ProblemState {
  final String error;

  GetAllProblemTypesErrorState({required this.error});
}
