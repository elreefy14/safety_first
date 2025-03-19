import 'package:flutter/material.dart';
import 'package:safety_frist/users/client/bookings/presentation/widgets/client_task_list_details_widget.dart';

import '../widgets/service_card.dart';

class ClientBookingsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      "type": "توصيل طلبات",
      "status": "قيد الانتظار",
      "icon": Icons.access_time,
      "color": Colors.orange,
    },
    {
      "type": "خدمة تنظيف",
      "status": "جاري التنفيذ",
      "icon": Icons.sync,
      "color": Colors.blue,
    },
    {
      "type": "صيانة أجهزة",
      "status": "مكتملة",
      "icon": Icons.check_circle,
      "color": Colors.green,
    },
    {
      "type": "توصيل طلبات",
      "status": "قيد الانتظار",
      "icon": Icons.access_time,
      "color": Colors.orange,
    },
    {
      "type": "خدمة تنظيف",
      "status": "جاري التنفيذ",
      "icon": Icons.sync,
      "color": Colors.blue,
    },
    {
      "type": "صيانة أجهزة",
      "status": "مكتملة",
      "icon": Icons.check_circle,
      "color": Colors.green,
    },
    {
      "type": "توصيل طلبات",
      "status": "قيد الانتظار",
      "icon": Icons.access_time,
      "color": Colors.orange,
    },
    {
      "type": "خدمة تنظيف",
      "status": "جاري التنفيذ",
      "icon": Icons.sync,
      "color": Colors.blue,
    },
    {
      "type": "صيانة أجهزة",
      "status": "مكتملة",
      "icon": Icons.check_circle,
      "color": Colors.green,
    },
  ];

  ClientBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: ListView.builder(
        padding: EdgeInsets.all(3.0),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return ServiceCard(
            serviceType: services[index]["type"],
            status: services[index]["status"],
            statusIcon: services[index]["icon"],
            statusColor: services[index]["color"],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ClientTaskListDetailsWidget(
                        title: services[index]["type"],
                        description:
                            "تفاصيل عن الخدمة: ${services[index]["type"]}",
                        imagePath: "assets/images/fear.jpeg",
                      ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
