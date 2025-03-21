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

class ClientAddTaskFormWidget extends StatelessWidget {
  const ClientAddTaskFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProblemCubit, ProblemState>(
      listener: (context, state) {
        if (state is ProblemSuccess) {
          showToast(msg: "تم رفع المشكله بنجاح", color: Colors.green);
          context.read<ProblemCubit>().descriptionController.clear();
          context.read<ProblemCubit>().problemImageFile = null;
          context.read<ProblemCubit>().serviceType = -1;
        } else if (state is ProblemFailure) {
          showToast(msg: "لم يتم رفع المشكله ", color: Colors.red);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ProblemCubit>();

        return AutofillGroup(
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                TaskImageWidget(),
                verticalSpace(15),
                SelectTypeServiceDropdown(),
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
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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
    );
  }
}
