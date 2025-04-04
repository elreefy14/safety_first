// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/engineer_problems_cubit.dart';
import 'package:safety_frist/users/admin/bookings/presentation/widgets/task_list_card.dart';

class TaskTabs extends StatelessWidget {
  const TaskTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: TabBar(
              isScrollable: true,
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.blueGrey,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue.withOpacity(0.2),
              ),
              onTap: (value) {
                log('$value');
                if (value == 0) {
                  EngineerProblemsCubit.get(context).getAllProblems();
                } else if (value == 1) {
                  EngineerProblemsCubit.get(
                    context,
                  ).getProblemsByStatus(statusId: 0);
                } else if (value == 2) {
                  EngineerProblemsCubit.get(
                    context,
                  ).getProblemsByStatus(statusId: 1);
                } else if (value == 3) {
                  EngineerProblemsCubit.get(
                    context,
                  ).getProblemsByStatus(statusId: 2);
                }
              },
              tabs: const [
                Tab(text: 'الجميع'),
                Tab(text: '⏳ قيد الانتظار'),
                Tab(text: '🔄 جاري التنفيذ'),
                Tab(text: '✅ مكتملة'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TabBarView(
                children: const [
                  TaskList(status: 'الجميع'),
                  TaskList(status: '⏳ قيد الانتظار'),
                  TaskList(status: '🔄 جاري التنفيذ'),
                  TaskList(status: '✅ مكتملة'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
