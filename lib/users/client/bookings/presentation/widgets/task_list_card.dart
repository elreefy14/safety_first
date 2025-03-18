import 'package:flutter/material.dart';
import 'package:safety_frist/users/client/bookings/presentation/widgets/task_list_details_widget.dart';

class TaskList extends StatelessWidget {
  final String status;
  const TaskList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> tasks = [];

    if (status == '🔄 جاري التنفيذ') {
      tasks = [
        {
          'title': ' مشكلة في الكهرباء',
          'description': 'هناك عطل في الدائرة الكهربائية.',
          'image': 'assets/images/fear.jpeg',
        },
        {
          'title': ' مشكلة في السباكة',
          'description': 'تسرب مياه في الحمام.',
          'image': 'assets/images/fear.jpeg',
        },
      ];
    }
    else if (status == '✅ مكتملة') {
      tasks = [
        {
          'title': ' إصلاح التكييف',
          'description': 'تم إصلاح التكييف المركزي.',
          'image': 'assets/images/fear.jpeg',
        },
        {
          'title': ' تغيير الإضاءة',
          'description': 'تم تغيير المصابيح التالفة.',
          'image': 'assets/images/fear.jpeg',
        },
      ];
    } else if (status == '⏳ قيد الانتظار') {
      tasks = [
        {
          'title': ' عطل في الإنترنت',
          'description': 'ضعف الاتصال بالإنترنت.',
          'image': 'assets/images/fear.jpeg',
        },
        {
          'title': ' مشكلة في الباب',
          'description': 'الباب الرئيسي لا يغلق جيدًا.',
          'image': 'assets/images/fear.jpeg',
        },
      ];
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => TaskDetailsScreen(
                      title: tasks[index]['title']!,
                      description: tasks[index]['description']!,
                      imagePath: tasks[index]['image']!,
                    ),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            child: Container(
              padding: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  tasks[index]['title']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'الحالة: $status',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey.shade600,
                  ),
                ),
                trailing: Icon(
                  status == '✅ مكتملة'
                      ? Icons.check_circle
                      : status == '🔄 جاري التنفيذ'
                      ? Icons.timelapse
                      : Icons.hourglass_empty,
                  size: 28,
                  color:
                      status == '✅ مكتملة'
                          ? Colors.green
                          : status == '🔄 جاري التنفيذ'
                          ? Colors.orange
                          : Colors.red,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
