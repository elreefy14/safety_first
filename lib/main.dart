import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/app/safety_first_app.dart';
import 'package:safety_frist/core/cache/shared_pref_helper.dart';
import 'package:safety_frist/core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await CacheHelper.init();
  await ScreenUtil.ensureScreenSize();
  runApp(SafetyFirstApp());
}
