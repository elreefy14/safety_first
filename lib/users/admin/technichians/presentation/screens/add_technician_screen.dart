import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/widgets/appbar_icon.dart';
import 'package:safety_frist/users/admin/technichians/presentation/widgets/add_technician_bloc_listener.dart';
import 'package:safety_frist/users/admin/technichians/presentation/widgets/add_technician_form_widget.dart';

class AddTechnicianScreen extends StatelessWidget {
  const AddTechnicianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddTechnicianBlocListener(
      child: Scaffold(
        appBar: AppBar(title: Text('أضافة فني جديد'), leading: AppbarIcon()),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
              child: AddTechnicianFormWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
