import 'package:flutter/material.dart';
import '../widgets/tabs_widget.dart';

class ClientBookingsScreen extends StatelessWidget {
  const ClientBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            SizedBox(
              height: 150,// 🔹 يضمن أن `TaskTabs` تمتد وتأخذ الحجم المناسب
              child: TaskTabs(),
            ),
          ],
        );
  }
}
