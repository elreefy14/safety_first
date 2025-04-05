import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/users/tech/presentation/logic/technician_problems_cubit.dart';
import 'package:safety_frist/users/tech/presentation/logic/technician_problems_state.dart';
import 'package:safety_frist/users/tech/presentation/widgets/technician_problems_list_view_item.dart';

class TechnicianProblemsListView extends StatelessWidget {
  const TechnicianProblemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechnicianProblemsCubit, TechnicianProblemsState>(
      builder: (context, state) {
        var problems = TechnicianProblemsCubit.get(context).technicianProblems;
        return SizedBox(
          height: 500.h,
          child: ListView.builder(
            itemCount: problems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: TechnicianProblemsListViewItem(problem: problems[index]),
              );
            },
          ),
        );
      },
    );
  }
}
