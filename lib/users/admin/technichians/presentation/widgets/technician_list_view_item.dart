import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/users/admin/technichians/data/models/technician_response_model.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/technician/technician_cubit.dart';

class TechnicianListViewItem extends StatelessWidget {
  const TechnicianListViewItem({super.key, required this.technician});

  final TechnicianResponseModel technician;

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
          title: 'حذف فني',
          desc: 'هل تريد حذف هذا الفني من نظام الصيانة',
          reverseBtnOrder: true,
          btnCancelText: 'لا',
          btnOkText: 'نعم',
          buttonsTextStyle: TextStyle(fontSize: 20, color: Colors.white),
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            TechnicianCubit.get(context).deleteTechnician(id: technician.id!);
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset('assets/images/bussiness-man.png'),
            ),
            horizontalSpace(16),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${technician.firstName!} ${technician.lastName!}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  verticalSpace(8),
                  Text(
                    technician.email!,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
