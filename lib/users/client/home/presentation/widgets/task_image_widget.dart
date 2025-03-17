import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';

class TaskImageWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const TaskImageWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blueGrey, width: 1.5.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_photo_alternate_outlined,
              size: 50,
              color: Colors.blueGrey,
            ),
            verticalSpace(8),
            Text(
              "اضغط لإضافة صورة",
              style: TextStyle(fontSize: 16.sp, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
