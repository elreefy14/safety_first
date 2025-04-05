import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/di/dependency_injection.dart';
import 'package:safety_frist/core/helper/functions/problem_status.dart';
import 'package:safety_frist/core/helper/functions/show_toast.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/app_text_form_field.dart';
import 'package:safety_frist/core/widgets/appbar_icon.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';
import 'package:safety_frist/users/tech/presentation/logic/technician_problems_cubit.dart';
import 'package:safety_frist/users/tech/presentation/logic/technician_problems_state.dart';

class TechnicianProblemDetailsScreen extends StatelessWidget {
  const TechnicianProblemDetailsScreen({super.key, required this.problem});

  final ProblemResponseModel problem;

  @override
  Widget build(BuildContext context) {
    TextEditingController desController = TextEditingController();

    return BlocProvider(
      create: (context) => getIt<TechnicianProblemsCubit>(),
      child: BlocConsumer<TechnicianProblemsCubit, TechnicianProblemsState>(
        listener: (context, state) {
          if (state is UpdateProblemStatusSuccessState) {
            showToast(msg: 'تم تحديث حالة الطلب بنجاح', color: Colors.green);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text("تحديث الطلب"), leading: AppbarIcon()),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          problem.imageUrl!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      verticalSpace(20),
                      Row(
                        children: [
                          Text(
                            "اسم العميل: ",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(color: Colors.blue),
                          ),
                          Text(
                            problem.clientName!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      verticalSpace(20),
                      Row(
                        children: [
                          Text(
                            "اسم الفني: ",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(color: Colors.blue),
                          ),
                          Text(
                            problem.technicianName! == 'Unassigned'
                                ? 'لم يتم التحديد بعد'
                                : problem.technicianName!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      verticalSpace(20),
                      Row(
                        children: [
                          Text(
                            "نوع الخدمة: ",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(color: Colors.blue),
                          ),
                          Text(
                            serviceType(type: problem.type!),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      verticalSpace(20),
                      Text(
                        "وصف الخدمة: ",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(color: Colors.blue),
                      ),
                      verticalSpace(8),
                      AppTextFormField(
                        maxLines: 4,
                        hintText: problem.description,
                        controller: desController,
                      ),
                      verticalSpace(30),
                      SizedBox(
                        width: double.infinity,
                        child: AppTextButton(
                          textButton: 'تحديث حالة الطلب',
                          isLoading:
                              state is UpdateProblemStatusLoadingState
                                  ? true
                                  : false,
                          onPressed: () {
                            TechnicianProblemsCubit.get(
                              context,
                            ).updateProblemStatus(problemId: problem.id!);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
