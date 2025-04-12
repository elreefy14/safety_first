import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/problems/engineer_problems_cubit.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/problems/engineer_problems_state.dart';
import 'package:safety_frist/users/admin/bookings/presentation/widgets/engineer_problem_list_view_item.dart';
import 'package:safety_frist/users/admin/bookings/presentation/widgets/problem_shimmer_loading_widget.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';

class TaskList extends StatelessWidget {
  final String status;
  const TaskList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EngineerProblemsCubit, EngineerProblemsState>(
      builder: (context, state) {
        var listProblems = EngineerProblemsCubit.get(context).allProblemsList;

        return ListView.builder(
          itemCount: listProblems.length,
          itemBuilder: (context, index) {
            return showListViewItem(listProblems, index, state);
          },
        );
      },
    );
  }

  Widget showListViewItem(
    List<ProblemResponseModel> listProblems,
    int index,
    state,
  ) {
    if (state is GetProblemsLoadingState) {
      return ProblemShimmerLoadingWidget();
    } else {
      return EngineerProblemListViewItem(problemModel: listProblems[index]);
    }
  }
}
