import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';

class ServiceCard extends StatelessWidget {
  final String serviceType;
  final String status;
  final IconData statusIcon;
  final Color statusColor;
  final VoidCallback? onTap;

  const ServiceCard({
    super.key,
    required this.serviceType,
    required this.status,
    required this.statusIcon,
    required this.statusColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
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
                    serviceType,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  verticalSpace(4),
                  Row(
                    children: [
                      Icon(statusIcon, color: statusColor, size: 18),
                      horizontalSpace(5),
                      Text(
                        status,
                        style: TextStyle(fontSize: 16, color: statusColor, fontWeight: FontWeight.bold),
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
