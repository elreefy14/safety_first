import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/users/client/bookings/presentation/logic/client_problems_cubit.dart';
import 'package:safety_frist/users/client/bookings/presentation/widgets/client_problem_list_view_item.dart';

class ClientProblemListView extends StatelessWidget {
  const ClientProblemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientProblemsCubit, ClientProblemsState>(
      builder: (context, state) {
        var problems = ClientProblemsCubit.get(context).clientProblems;
        return SizedBox(
          height: 500.h,
          child: ListView.builder(
            itemCount: problems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: ClientProblemListViewItem(problem: problems[index]),
              );
            },
          ),
        );
      },
    );
  }
}
