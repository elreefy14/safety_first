import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_frist/core/di/dependency_injection.dart' show getIt;
import 'package:safety_frist/core/helper/functions/show_toast.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/technician/technician_cubit.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/technician/technician_state.dart';

class AddTechnicianBlocListener extends StatelessWidget {
  const AddTechnicianBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TechnicianCubit>(),
      child: BlocListener<TechnicianCubit, TechnicianState>(
        child: child,
        listener: (context, state) {
          switch (state) {
            case AddTechnicianSuccessState():
              context.pop();
              showToast(msg: 'تم إضافة الفني بنجاح', color: Colors.green);

            default:
          }
        },
      ),
    );
  }

  void setupError(BuildContext context, error) {
    showToast(msg: 'فشلت عملية إضافة الفني', color: Colors.red);
  }
}
