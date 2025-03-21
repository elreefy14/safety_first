import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:safety_frist/users/client/home/presentation/logic/problem_cubit.dart';

class SelectTypeServiceDropdown extends StatefulWidget {
  const SelectTypeServiceDropdown({super.key});

  @override
  State<SelectTypeServiceDropdown> createState() =>
      _SelectTypeServiceDropdownState();
}

class _SelectTypeServiceDropdownState extends State<SelectTypeServiceDropdown> {
  String? selectedService;
  final List<String> services = ["🔥 إصلاح انظمة الحرائق", "🛠️ الإصلاح العام"];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      value: selectedService,
      iconStyleData: IconStyleData(
        icon: Icon(
          Icons.expand_more_outlined,
          size: 28,
          color: Colors.blueGrey,
        ),
      ),
      alignment: AlignmentDirectional.topStart,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        hintText: "اختر الخدمة",
        hintStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
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
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
      ),
      menuItemStyleData: MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 12),
        height: 45,
      ),
      items:
          services.map((service) {
            return DropdownMenuItem<String>(
              value: service,
              child: Text(
                service,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:
                      service == selectedService
                          ? Colors.blue
                          : Colors.blueGrey,
                ),
              ),
            );
          }).toList(),
      onChanged: (value) {
        if (value == services[0]) {
          ProblemCubit.get(context).serviceType = 0;
        } else if (value == services[1]) {
          ProblemCubit.get(context).serviceType = 1;
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "يرجى اختيار الخدمة";
        }
        return null;
      },
    );
  }
}
