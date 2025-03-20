import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/functions/app_regex.dart';
import 'package:safety_frist/core/widgets/app_text_form_field.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({
    super.key,
    required this.name,
    required this.nameController,
  });

  final String name;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  $name',
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(color: Color(0xff000000)),
        ),
        GestureDetector(
          onTap: () {
            focusNode.requestFocus();
          },
          child: AppTextFormField(
            textInputType: TextInputType.name,
            hintText: 'الإسم',
            controller: nameController,
            focusNode: focusNode,
            enabled: true,
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
