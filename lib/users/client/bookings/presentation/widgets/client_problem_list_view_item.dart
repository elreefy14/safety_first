import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/helper/functions/problem_status.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';

class ClientProblemListViewItem extends StatelessWidget {
  const ClientProblemListViewItem({super.key, required this.problem});

  final ProblemResponseModel problem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.store, color: Colors.red, size: 32),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceType(type: problem.type!),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  verticalSpace(4),
                  Row(
                    children: [
                      Icon(
                        statusIcon(status: problem.status!),
                        color: statusColor(status: problem.status!),
                        size: 18,
                      ),
                      horizontalSpace(5),
                      Text(
                        statusText(status: problem.status!),
                        style: TextStyle(
                          fontSize: 16,
                          color: statusColor(status: problem.status!),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
