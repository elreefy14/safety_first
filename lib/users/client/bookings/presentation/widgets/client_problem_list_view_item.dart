import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/helper/functions/problem_status.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/users/admin/bookings/presentation/screens/problem_details_screen.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';
import 'package:safety_frist/users/client/bookings/presentation/logic/client_problems_cubit.dart';

class ClientProblemListViewItem extends StatelessWidget {
  const ClientProblemListViewItem({super.key, required this.problem});

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
            ClientProblemsCubit.get(
              context,
            ).getProblemById(problemId: problem.id!);
            _navigateToClientProblemDetailsScreen(
              context: context,
              problem: problem,
            );
          },
        ).show();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
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
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.store, color: Colors.red, size: 32),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    problem.problemTypeName!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  verticalSpace(4),
                  Row(
                    children: [
                      Icon(
                        statusIcon(status: problem.status!),
                        color: statusColor(status: problem.status!),
                        size: 18,
                      ),
                      horizontalSpace(5),
                      Text(
                        statusText(status: problem.status!),
                        style: TextStyle(
                          fontSize: 16,
                          color: statusColor(status: problem.status!),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.question,
                  customHeader: Icon(Icons.delete),
                  animType: AnimType.rightSlide,
                  title: 'حذف الطلب',
                  desc: 'هل تريد حدف الطلب بالفعل',
                  reverseBtnOrder: true,
                  btnCancelText: 'لا',
                  btnOkText: 'نعم',
                  buttonsTextStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    ClientProblemsCubit.get(
                      context,
                    ).deleteProblem(problemId: problem.id!);
                  },
                ).show();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToClientProblemDetailsScreen({
    required BuildContext context,
    required ProblemResponseModel problem,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) =>
                ProblemDetailsScreen(problem: problem),
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
