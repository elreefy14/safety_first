import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/di/dependency_injection.dart';
import 'package:safety_frist/core/shared/profile/presentation/widgets/add_service_floating_action_buttom.dart';
import 'package:safety_frist/core/shared/profile/presentation/widgets/service_type_list_view_item.dart';
import 'package:safety_frist/core/shared/profile/presentation/widgets/service_types_list_view_shimmer_widget.dart';
import 'package:safety_frist/core/widgets/appbar_icon.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/problem%20type/problem_type_cubit.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/problem%20type/problem_type_state.dart';

class EngineerServiceTypeScreen extends StatelessWidget {
  const EngineerServiceTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProblemTypeCubit>()..getAllProblemTypes(),
      child: Scaffold(
        appBar: AppBar(title: Text('الخدمات المتاحة'), leading: AppbarIcon()),
        floatingActionButton: Builder(
          builder: (innerContext) {
            return _floatingActionButton(innerContext);
          },
        ),
        body: SafeArea(
          child: Builder(
            builder: (innerContext) {
              return RefreshIndicator(
                onRefresh: () => _refreshData(innerContext),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 30.h,
                  ),
                  child: BlocConsumer<ProblemTypeCubit, ProblemTypeState>(
                    listener: (context, state) {
                      if (state is GetAllProblemTypesLoadingState) {
                        ServiceTypesListViewShimmerWidget();
                      }
                    },
                    builder: (context, state) {
                      return state is GetAllProblemTypesLoadingState
                          ? ServiceTypesListViewShimmerWidget()
                          : ListView.builder(
                            itemCount:
                                ProblemTypeCubit.get(
                                  context,
                                ).allProblemTypesList.length,
                            itemBuilder:
                                (context, index) => Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: ServiceTypeListViewItem(
                                    typeModel:
                                        ProblemTypeCubit.get(
                                          context,
                                        ).allProblemTypesList[index],
                                  ),
                                ),
                          );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return AddServiceFloatingActionButtom();
  }

  Future<void> _refreshData(innerContext) async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => getIt<ProblemTypeCubit>().getAllProblemTypes(),
    );
  }
}
