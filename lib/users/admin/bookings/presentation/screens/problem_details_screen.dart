import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/widgets/appbar_icon.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';

class ProblemDetailsScreen extends StatelessWidget {
  final ProblemResponseModel problem;
  const ProblemDetailsScreen({super.key, required this.problem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تفاصيل المشكلة"), leading: AppbarIcon()),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                problem.imageUrl!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            verticalSpace(20),
            Row(
              children: [
                Text(
                  "اسم العميل: ",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: Colors.blue),
                ),
                Text(
                  problem.clientName!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            verticalSpace(20),
            Row(
              children: [
                Text(
                  "اسم الفني: ",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: Colors.blue),
                ),
                Text(
                  problem.technicianName! == 'Unassigned'
                      ? 'لم يتم التحديد بعد'
                      : problem.technicianName!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            verticalSpace(20),
            Row(
              children: [
                Text(
                  "نوع الخدمة: ",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: Colors.blue),
                ),
                Text(
                  problem.problemTypeName!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            verticalSpace(20),
            Text(
              "وصف الخدمة: ",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: Colors.blue),
            ),
            verticalSpace(8),
            TextField(
              controller: TextEditingController(text: problem.description),
              maxLines: 4,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
