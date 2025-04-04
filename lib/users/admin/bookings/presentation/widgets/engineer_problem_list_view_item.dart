import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safety_frist/core/helper/functions/problem_status.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/engineer_problems_cubit.dart';
import 'package:safety_frist/users/admin/bookings/presentation/screens/problem_details_screen.dart';
import 'package:safety_frist/users/admin/bookings/presentation/widgets/select_technichian_to_problem.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/technician/technician_cubit.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/technician/technician_state.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';

class EngineerProblemListViewItem extends StatelessWidget {
  const EngineerProblemListViewItem({super.key, required this.problemModel});

  final ProblemResponseModel problemModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.question,
          customHeader: SvgPicture.asset(
            'assets/icons/power_settings_new.svg',
            height: 50,
          ),
          animType: AnimType.rightSlide,
          title: 'إرسال المشكلة إلي الفني',
          desc: 'هل تريد إرسال هذه المشكلة إلي فني متخصص',
          reverseBtnOrder: true,
          btnCancelText: 'عرض المشكلة',
          btnOkText: 'اختيار فني',
          buttonsTextStyle: TextStyle(fontSize: 20, color: Colors.white),
          btnCancelOnPress: () {
            EngineerProblemsCubit.get(
              context,
            ).getProblemById(problemId: problemModel.id!);
            _navigateToProblemDetailsScreen(
              context: context,
              problem: problemModel,
            );
          },
          btnOkOnPress: () {
            selectTechnicianForPoblem(context);
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
            Expanded(child: Image.network(problemModel.imageUrl!, height: 100)),
            horizontalSpace(16),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'العميل: ${problemModel.clientName!}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  verticalSpace(8),
                  Text(
                    'المشكلة: ${serviceType(type: problemModel.type!)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PersistentBottomSheetController selectTechnicianForPoblem(
    BuildContext context,
  ) {
    return showBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder:
          (context) => Container(
            width: double.infinity,
            height: 500.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            decoration: ShapeDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'قم بإختيار الفني المناسب',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                verticalSpace(20),
                Expanded(
                  child: BlocBuilder<TechnicianCubit, TechnicianState>(
                    builder: (context, state) {
                      var technicians =
                          TechnicianCubit.get(context).allTechniciansList;
                      return ListView.builder(
                        itemCount: technicians.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: SelectTechnichianToProblem(
                              technician: technicians[index],
                              problemId: problemModel.id!,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }

  void _navigateToProblemDetailsScreen({
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
