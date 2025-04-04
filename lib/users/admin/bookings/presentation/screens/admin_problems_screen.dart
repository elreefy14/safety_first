import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/tabs_widget.dart';

class AdminProblemsScreen extends StatelessWidget {
  const AdminProblemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(),
          Expanded(child: SizedBox(height: 700.w, child: TaskTabs())),
        ],
      ),
    );
  }
}
