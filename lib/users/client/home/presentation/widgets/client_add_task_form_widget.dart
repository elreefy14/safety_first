import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/users/client/home/presentation/widgets/select_type_service_dropdown.dart';
import 'package:safety_frist/users/client/home/presentation/widgets/task_description_widget.dart';
import 'package:safety_frist/users/client/home/presentation/widgets/task_image_widget.dart';

class ClientAddTaskFormWidget extends StatefulWidget {
  const ClientAddTaskFormWidget({super.key});

  @override
  State<ClientAddTaskFormWidget> createState() =>
      _ClientAddTaskFormWidgetState();
}

class _ClientAddTaskFormWidgetState extends State<ClientAddTaskFormWidget> {
  String? selectedService;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TaskImageWidget(),
            verticalSpace(15),
            SelectTypeServiceDropdown(
              selectedService: selectedService,
              onChanged: (value) {
                setState(() {
                  selectedService = value;
                });
              },
            ),
            verticalSpace(15),
            TaskDescriptionWidget(),
            verticalSpace(20),
            SizedBox(
              width: double.infinity,
              child: AppTextButton(
                textButton: 'إرسال',
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                backgroundColor: Colors.blue[900],
                onPressed: () {

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
