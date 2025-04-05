import 'package:flutter/material.dart';

String statusText({required int status}) {
  if (status == 0) {
    return "قيد الانتظار";
  } else if (status == 1) {
    return "جاري التنفيذ";
  } else {
    return "مكتملة";
  }
}

String serviceType({required int type}) {
  if (type == 0) {
    return 'إصلاح انظمة الحرائق';
  } else {
    return 'الأصلاح العام';
  }
}

Color statusColor({required int status}) {
  if (status == 0) {
    return Colors.orange;
  } else if (status == 1) {
    return Colors.blue;
  } else {
    return Colors.green;
  }
}

IconData statusIcon({required int status}) {
  if (status == 0) {
    return Icons.access_time;
  } else if (status == 1) {
    return Icons.sync;
  } else {
    return Icons.done_outline;
  }
}
