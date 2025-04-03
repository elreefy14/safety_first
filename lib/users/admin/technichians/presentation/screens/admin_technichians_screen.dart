import 'package:flutter/material.dart';
import 'package:safety_frist/users/admin/technichians/presentation/widgets/technician_list_view.dart';

class AdminTechnichiansScreen extends StatelessWidget {
  const AdminTechnichiansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SizedBox(), Expanded(child: TechnicianListView())],
    );
  }
}
