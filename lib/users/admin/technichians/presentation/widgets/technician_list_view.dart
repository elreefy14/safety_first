import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/technician/technician_cubit.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/technician/technician_state.dart';
import 'package:safety_frist/users/admin/technichians/presentation/widgets/technician_list_view_item.dart';

class TechnicianListView extends StatelessWidget {
  const TechnicianListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechnicianCubit, TechnicianState>(
      builder: (context, state) {
        var technicians = TechnicianCubit.get(context).allTechniciansList;
        return SizedBox(
          height: 500.h,
          child: ListView.builder(
            itemCount: technicians.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: TechnicianListViewItem(technician: technicians[index]),
              );
            },
          ),
        );
      },
    );
  }
}
