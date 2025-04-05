import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/helper/functions/problem_status.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';
import 'package:safety_frist/users/tech/presentation/logic/technician_problems_cubit.dart';
import 'package:safety_frist/users/tech/presentation/screens/technician_problem_details_screen.dart';

class TechnicianProblemsListViewItem extends StatelessWidget {
  const TechnicianProblemsListViewItem({super.key, required this.problem});

  final ProblemResponseModel problem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.question,
          customHeader: Icon(Icons.update),
          animType: AnimType.rightSlide,
          title: 'تفاصيل المشكلة',
          desc: 'هل تريد عرض تفاصيل المشكلة',
          reverseBtnOrder: true,
          btnCancelText: 'لا',
          btnOkText: 'نعم',
          buttonsTextStyle: TextStyle(fontSize: 20.sp, color: Colors.white),
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            TechnicianProblemsCubit.get(
              context,
            ).getProblemById(problemId: problem.id!);
            _navigateToTechnicianProblemDetailsScreen(
              context: context,
              problem: problem,
            );
          },
        ).show();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Image.network(problem.imageUrl!, height: 100)),
            horizontalSpace(16),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'العميل: ${problem.clientName!}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  verticalSpace(8),
                  Text(
                    'المشكلة: ${serviceType(type: problem.type!)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Text(
                        'الحالة: ${statusText(status: problem.status!)}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      horizontalSpace(16),
                      Icon(
                        statusIcon(status: problem.status!),
                        color: statusColor(status: problem.status!),
                        size: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToTechnicianProblemDetailsScreen({
    required BuildContext context,
    required ProblemResponseModel problem,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) =>
                TechnicianProblemDetailsScreen(problem: problem),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeInOut));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }
}
