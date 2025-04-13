import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ServiceTypesListViewShimmerWidget extends StatelessWidget {
  const ServiceTypesListViewShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder:
          (context, index) => Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(width: 40, height: 40, color: Colors.white),
                ),
                title: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 16,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
