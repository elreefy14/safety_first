import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_frist/core/di/dependency_injection.dart' show getIt;
import 'package:safety_frist/core/helper/functions/show_toast.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/engineer/engineer_cubit.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/engineer/engineer_state.dart';

class AddEngineerBlocListener extends StatelessWidget {
  const AddEngineerBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EngineerCubit>(),
      child: BlocListener<EngineerCubit, EngineerState>(
        child: child,
        listener: (context, state) {
          switch (state) {
            case AddEngineerSuccessState():
              context.pop();
              showToast(msg: 'تم إضافة المهندس بنجاح', color: Colors.green);

            default:
          }
        },
      ),
    );
  }

  void setupError(BuildContext context, error) {
    showToast(msg: 'فشلت عملية إضافة المهندس', color: Colors.red);
  }
}
