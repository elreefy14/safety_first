import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/widgets/appbar_icon.dart';
import 'package:safety_frist/users/admin/technichians/presentation/widgets/add_engineer_bloc_listener.dart';
import 'package:safety_frist/users/admin/technichians/presentation/widgets/add_engineer_form_widget.dart';

class AddEngineerScreen extends StatelessWidget {
  const AddEngineerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddEngineerBlocListener(
      child: Scaffold(
        appBar: AppBar(title: Text('أضافة مهندس جديد'), leading: AppbarIcon()),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
              child: AddEngineerFormWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
