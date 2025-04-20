import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/users/client/home/presentation/logic/problem_cubit.dart';
import 'package:safety_frist/users/client/home/presentation/logic/problem_states.dart';

class TaskImageWidget extends StatelessWidget {
  const TaskImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProblemCubit, ProblemState>(
      builder: (context, state) {
        final File? problemImage = ProblemCubit.get(context).problemImageFile;
        return GestureDetector(
          onTap: () {
            showBottomSheet(
              context: context,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              builder: (context) {
                return selectImageBottomSheet(context);
              },
            );
          },
          child: Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blueGrey, width: 1.5.w),
              image:
                  problemImage != null
                      ? DecorationImage(
                        image: FileImage(File(problemImage.path)),
                        fit: BoxFit.cover,
                      )
                      : null,
            ),
            child:
                problemImage == null
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 50,
                          color: Colors.blueGrey,
                        ),
                        verticalSpace(8),
                        Text(
                          "اضغط لإضافة صورة",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    )
                    : null,
          ),
        );
      },
    );
  }

  Widget selectImageBottomSheet(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          verticalSpace(12),
          ListTile(
            leading: Icon(Icons.photo_library, color: Colors.blue),
            title: Text(
              'اختر من المعرض',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            onTap: () {
              Navigator.pop(context);
              ProblemCubit.get(context).getProblemImage(ImageSource.gallery);
            },
          ),
          Divider(height: 1, color: Colors.grey[300]),
          ListTile(
            leading: Icon(Icons.camera_alt, color: Colors.green),
            title: Text(
              'التقط صورة',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            onTap: () {
              Navigator.pop(context);
              ProblemCubit.get(context).getProblemImage(ImageSource.camera);
            },
          ),
        ],
      ),
    );
  }
}
