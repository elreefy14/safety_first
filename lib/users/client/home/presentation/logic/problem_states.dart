
import 'package:flutter/cupertino.dart';

import '../../data/model/problem_model.dart';
@immutable
sealed class ProblemState {}

class ProblemInitial extends ProblemState {}

class ProblemLoading extends ProblemState {}

class ProblemSuccess extends ProblemState {
  final ProblemModel problem;
  ProblemSuccess(this.problem);

}

class ProblemFailure extends ProblemState {
  final String error;
  ProblemFailure(this.error);

}
class ProblemImageSelected extends ProblemState {
  final String service;
  ProblemImageSelected(this.service);
}

