import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/helper/functions/show_toast.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/users/client/home/presentation/logic/problem_cubit.dart';
import 'package:safety_frist/users/client/home/presentation/logic/problem_states.dart';
import 'package:safety_frist/users/client/home/presentation/widgets/select_type_service_dropdown.dart';
import 'package:safety_frist/users/client/home/presentation/widgets/task_description_widget.dart';
import 'package:safety_frist/users/client/home/presentation/widgets/task_image_widget.dart';
import 'package:safety_frist/core/di/dependency_injection.dart';
import 'dart:io';

class ClientAddTaskFormWidget extends StatelessWidget {
  const ClientAddTaskFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProblemCubit>(),
      child: BlocListener<ProblemCubit, ProblemState>(
        listener: (context, state) {
          if (state is ProblemSuccess) {
            showToast(msg: "تم رفع المشكله بنجاح", color: Colors.green);
            // // إعادة تعيين الحقول بعد النجاح
            // context.read<ProblemCubit>().descriptionController.clear();
            // context.read<ProblemCubit>().selectedService = null;
            // context.read<ProblemCubit>().imageFile = null;
          } else  {
            showToast(msg: "لم يتم رفع المشكله ", color: Colors.red);


          }

        },
        child: Builder(
          builder: (context) {
            final cubit = context.read<ProblemCubit>();
            return AutofillGroup(
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    TaskImageWidget(
                      onImageSelected: (path) {
                        cubit.imageFile = File(path);
                      },
                    ),
                    verticalSpace(15),
                    SelectTypeServiceDropdown(
                      selectedService: cubit.selectedService,
                      onChanged: (value) => cubit.selectedService = value,
                    ),
                    verticalSpace(15),
                    TaskDescriptionWidget(controller: cubit.descriptionController),
                    verticalSpace(20),
                    BlocBuilder<ProblemCubit, ProblemState>(
                      builder: (context, state) {
                        return SizedBox(
                          width: double.infinity,
                          child: AppTextButton(
                            textButton: 'إرسال',
                            isLoading: state is ProblemLoading,
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            backgroundColor: Colors.blue[900],
                            onPressed: () {
                              cubit.createProblem();
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
    );
  }
}
