import 'package:flutter/material.dart';
import 'package:safety_frist/core/widgets/app_text_form_field.dart';

class TaskDescriptionWidget extends StatelessWidget {
  const TaskDescriptionWidget({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: "أضف وصفًا للمشكلة...",
      maxLines: 4,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'لا يمكنك ترك الوصف فارغ';
        }
      },
    );
  }
}
