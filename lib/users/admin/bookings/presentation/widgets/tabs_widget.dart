// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/problems/engineer_problems_cubit.dart';
import 'package:safety_frist/users/admin/bookings/presentation/widgets/task_list_card.dart';

class TaskTabs extends StatefulWidget {
  const TaskTabs({super.key});

  @override
  State<TaskTabs> createState() => _TaskTabsState();
}

class _TaskTabsState extends State<TaskTabs> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _statuses = [
    'الجميع',
    '⏳ قيد الانتظار',
    '🔄 جاري التنفيذ',
    '✅ مكتملة',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _statuses.length, vsync: this);
    _tabController.addListener(_handleTabChange);


    WidgetsBinding.instance.addPostFrameCallback((_) {
      EngineerProblemsCubit.get(context).getAllProblems();
    });
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) return;

    final cubit = EngineerProblemsCubit.get(context);
    switch (_tabController.index) {
      case 0:
        cubit.getAllProblems();
        break;
      case 1:
        cubit.getProblemsByStatus(statusId: 0);
        break;
      case 2:
        cubit.getProblemsByStatus(statusId: 1);
        break;
      case 3:
        cubit.getProblemsByStatus(statusId: 2);
        break;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.blueGrey,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue.withOpacity(0.2),
            ),
            tabs: _statuses.map((s) => Tab(text: s)).toList(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TabBarView(
              controller: _tabController,
              children: _statuses
                  .map((status) => TaskList(status: status))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

