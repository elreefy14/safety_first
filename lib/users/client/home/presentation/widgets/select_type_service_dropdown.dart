import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/users/client/home/presentation/logic/problem_cubit.dart';
import 'package:safety_frist/users/client/home/presentation/logic/problem_states.dart';

class SelectTypeServiceDropdown extends StatefulWidget {
  const SelectTypeServiceDropdown({super.key});

  @override
  State<SelectTypeServiceDropdown> createState() =>
      _SelectTypeServiceDropdownState();
}

class _SelectTypeServiceDropdownState extends State<SelectTypeServiceDropdown> {
  String? selectedService;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProblemCubit, ProblemState>(
      builder: (context, state) {
        var cubit = ProblemCubit.get(context);
        var services = cubit.allProblemTypesList;
        return DropdownButtonFormField2<String>(
          isExpanded: true,
          value: selectedService,
          alignment: AlignmentDirectional.bottomEnd,
          iconStyleData: IconStyleData(
            icon: Icon(
              Icons.expand_more_outlined,
              size: 28,
              color: Colors.blueGrey,
            ),
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            hintText: "اختر الخدمة",
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.blueGrey, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red, width: 1.5),
            ),
          ),
          buttonStyleData: ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            height: 50,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            useSafeArea: true,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
          ),
          menuItemStyleData: MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            height: 45.h,
          ),
          items:
              services.map((service) {
                return DropdownMenuItem<String>(
                  value: service.name,
                  child: Text(
                    service.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }).toList(),
          onChanged: (value) {
            for (var i = 0; i < services.length; i++) {
              if (value == services[i].name) {
                cubit.problemTypeIdController.text = services[i].id;
              }
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "يرجى اختيار الخدمة";
            }
            return null;
          },
        );
      },
    );
  }
}
