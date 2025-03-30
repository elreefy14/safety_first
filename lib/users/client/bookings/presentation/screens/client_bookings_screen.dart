import 'package:flutter/material.dart';
import 'package:safety_frist/users/client/bookings/presentation/widgets/client_problem_widget_item.dart';

class ClientBookingsScreen extends StatelessWidget {
  const ClientBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 700,
        child: ListView.builder(
          padding: EdgeInsets.all(3.0),
          itemCount: 16,
          itemBuilder: (context, index) {
            return ClientProblemWidgetItem();
          },
        ),
      ),
    );
  }
}
