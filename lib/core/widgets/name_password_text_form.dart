import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/functions/app_regex.dart';
import 'package:safety_frist/core/widgets/app_text_form_field.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    FocusNode focusNode = FocusNode(); // إنشاء focus node للتحكم في الكيبورد

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  $name',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Color(0xff000000)),
        ),
        GestureDetector(
          onTap: () {
            focusNode.requestFocus(); // إجبار الكيبورد على الفتح عند الضغط
          },
          child: AppTextFormField(
            textInputType: TextInputType.name,
            hintText: 'الإسم',
            controller: nameController,
            focusNode: focusNode, // تمرير focusNode لضمان التحكم
            enabled: true, // السماح بالكتابة
            prefixIcon: Icon(
              Icons.person_outline,
              color: Theme.of(context).iconTheme.color,
            ),
            validator: (value) {
              if (AppRegex.isNameValid(value!) == false) {
                return 'بالرجاء إدخال اسماً صالحاً';
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}
