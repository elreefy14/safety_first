import 'package:flutter/material.dart';
import 'package:safety_frist/users/client/bookings/presentation/widgets/client_problem_list_view.dart';

class ClientBookingsScreen extends StatelessWidget {
  const ClientBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SizedBox(), Expanded(child: ClientProblemListView())],
    );
  }
}
