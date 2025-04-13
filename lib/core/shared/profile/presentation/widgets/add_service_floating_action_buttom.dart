import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/app_text_form_field.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/problem%20type/problem_type_cubit.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/problem%20type/problem_type_state.dart';

class AddServiceFloatingActionButtom extends StatelessWidget {
  const AddServiceFloatingActionButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      textButton: 'إضافة خدمة',
      onPressed: () {
        final cubit = ProblemTypeCubit.get(context);

        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(9)),
          sheetAnimationStyle: AnimationStyle(curve: Curves.easeInToLinear),
          builder:
              (context) => BlocProvider.value(
                value: cubit,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    height: 300.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 30.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Form(
                      key: cubit.addFormKey,
                      child: Column(
                        children: [
                          Text(
                            'إضافة خدمة',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          verticalSpace(20),
                          AppTextFormField(
                            hintText: 'قم بكتابة اسم الخدمة',
                            controller: cubit.nameTypeController,
                          ),
                          verticalSpace(20),
                          BlocBuilder<ProblemTypeCubit, ProblemTypeState>(
                            builder: (context, state) {
                              return SizedBox(
                                width: double.infinity,
                                child: AppTextButton(
                                  textButton: 'إضافة',
                                  isLoading:
                                      state is AddProblemTypeLoadingState
                                          ? true
                                          : false,
                                  onPressed: () {
                                    if (cubit.updateFormKey.currentState!
                                        .validate()) {
                                      cubit.addProblemType();
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
        );
      },
    );
  }
}
