import 'package:flutter/material.dart';
import 'package:safety_frist/users/client/home/presentation/widgets/client_add_task_form_widget.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [ClientAddTaskFormWidget()]);
  }
}
