import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_deals/res/localization/localization_en.dart';
import 'package:test_deals/view_screen/dashboard_view_screen/dashboard_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale('en' ,'US'),
      fallbackLocale: const Locale('en' ,'US'),
      home: DashboardViewScreen(),
    );
  }
}
