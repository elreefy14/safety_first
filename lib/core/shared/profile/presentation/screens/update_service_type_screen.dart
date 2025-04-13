import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/di/dependency_injection.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/app_text_form_field.dart';
import 'package:safety_frist/core/widgets/appbar_icon.dart';
import 'package:safety_frist/users/admin/bookings/data/models/problem_type_response_model.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/problem%20type/problem_type_cubit.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/problem%20type/problem_type_state.dart';

class UpdateServiceTypeScreen extends StatelessWidget {
  final ProblemTypeResponseModel typeModel;

  const UpdateServiceTypeScreen({super.key, required this.typeModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProblemTypeCubit>(),
      child: Scaffold(
        appBar: AppBar(title: Text('تحديث الخدمة'), leading: AppbarIcon()),
        body: SafeArea(
          child: BlocBuilder<ProblemTypeCubit, ProblemTypeState>(
            builder: (context, state) {
              var cubit = ProblemTypeCubit.get(context);
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 12.w),
                child: Form(
                  key: ProblemTypeCubit.get(context).updateFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('اسم الخدمة'),
                      AppTextFormField(
                        hintText: typeModel.name,
                        controller: cubit.updateNameTypeController,
                        validator: (name) {
                          if (name!.isEmpty) {
                            return 'لا يمكنك ترك اسم الخدمة فارغ';
                          } else {
                            return null;
                          }
                        },
                      ),
                      verticalSpace(20),
                      BlocBuilder<ProblemTypeCubit, ProblemTypeState>(
                        builder: (context, state) {
                          return SizedBox(
                            width: double.infinity,
                            child: AppTextButton(
                              textButton: 'تحديث',
                              isLoading:
                                  state is UpdateProblemTypeLoadingState
                                      ? true
                                      : false,
                              onPressed: () {
                                if (cubit.updateFormKey.currentState!
                                    .validate()) {
                                  ProblemTypeCubit.get(
                                    context,
                                  ).updateProblemType(id: typeModel.id);
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
