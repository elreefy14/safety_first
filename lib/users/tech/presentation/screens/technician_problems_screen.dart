import 'package:flutter/material.dart';
import 'package:safety_frist/users/tech/presentation/widgets/technician_problems_list_view.dart';

class TechnicianProblemsScreen extends StatelessWidget {
  const TechnicianProblemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [SizedBox(), Expanded(child: TechnicianProblemsListView())],
    );
  }
}
