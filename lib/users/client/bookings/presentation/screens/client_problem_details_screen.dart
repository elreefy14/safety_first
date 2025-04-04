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
import 'package:safety_frist/users/client/bookings/presentation/logic/client_problems_cubit.dart';

class ClientProblemDetailsScreen extends StatelessWidget {
  const ClientProblemDetailsScreen({super.key, required this.problem});

  final ProblemResponseModel problem;

  @override
  Widget build(BuildContext context) {
    TextEditingController problemDescriptionController =
        TextEditingController();
    return BlocProvider(
      create: (context) => getIt<ClientProblemsCubit>(),
      child: BlocConsumer<ClientProblemsCubit, ClientProblemsState>(
        listener: (context, state) {
          if (state is UpdateProblemSuccessState) {
            showToast(msg: 'تم تحديث الطلب بنجاح', color: Colors.green);
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
                        // controller:
                        //     ClientProblemsCubit.get(context).problemDescriptionController,
                      ),
                      verticalSpace(30),
                      SizedBox(
                        width: double.infinity,
                        child: AppTextButton(
                          textButton: 'تحديث الطلب',
                          isLoading:
                              state is UpdateProblemLoadingState ? true : false,
                          onPressed: () {
                            ClientProblemsCubit.get(context).updateProblem(
                              problemId: problem.id!,
                              description: problemDescriptionController,
                            );
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
