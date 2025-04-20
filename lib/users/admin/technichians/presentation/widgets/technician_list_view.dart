import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/users/admin/technichians/data/models/technician_response_model.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/technician/technician_cubit.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/technician/technician_state.dart';
import 'package:safety_frist/users/admin/technichians/presentation/widgets/technician_list_view_item.dart';
import 'package:safety_frist/users/admin/technichians/presentation/widgets/technicians_shimmer_loading_widget.dart';

class TechnicianListView extends StatelessWidget {
  const TechnicianListView({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    await TechnicianCubit.get(context).getAllTechnicians();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechnicianCubit, TechnicianState>(
      builder: (context, state) {
        var technicians = TechnicianCubit.get(context).allTechniciansList;

        return SizedBox(
          height: 500.h,
          child: RefreshIndicator(
            onRefresh: () => _onRefresh(context),
            child: technicians.isEmpty && state is! GetAllTechniciansLoadingState
                ? ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 100.h),
                  child: Center(
                    child: Text(
                      'لا يوجد فنيين حالياً',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            )
                : ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: technicians.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: _showListViewItem(technicians, index, state),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _showListViewItem(
      List<TechnicianResponseModel> technicians,
      int index,
      TechnicianState state,
      ) {
    if (state is GetAllTechniciansLoadingState && technicians.isEmpty) {
      return const TechniciansShimmerLoadingWidget();
    } else {
      return TechnicianListViewItem(technician: technicians[index]);
    }
  }
}

