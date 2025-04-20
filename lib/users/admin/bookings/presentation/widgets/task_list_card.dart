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

  Future<void> _refresh(BuildContext context) async {
    final cubit = EngineerProblemsCubit.get(context);
    if (status == 'الجميع') {
      await cubit.getAllProblems();
    } else if (status == '⏳ قيد الانتظار') {
      await cubit.getProblemsByStatus(statusId: 0);
    } else if (status == '🔄 جاري التنفيذ') {
      await cubit.getProblemsByStatus(statusId: 1);
    } else if (status == '✅ مكتملة') {
      await cubit.getProblemsByStatus(statusId: 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _refresh(context),
      child: BlocBuilder<EngineerProblemsCubit, EngineerProblemsState>(
        builder: (context, state) {
          var listProblems =
              EngineerProblemsCubit.get(context).allProblemsList;

          if (state is GetProblemsLoadingState && listProblems.isEmpty) {
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (_, __) => const ProblemShimmerLoadingWidget(),
            );
          }

          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: listProblems.length,
            itemBuilder: (context, index) {
              return EngineerProblemListViewItem(
                problemModel: listProblems[index],
              );
            },
          );
        },
      ),
    );
  }
}

