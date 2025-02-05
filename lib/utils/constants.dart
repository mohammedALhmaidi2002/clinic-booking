import 'package:flutter/material.dart'; // استيراد مكتبة فلاتر الأساسية

// فئة لتخزين الألوان المستخدمة في التطبيق
class AppColors {
  static const Color primary = Colors.blueAccent; // اللون الأساسي
  static const Color secondary = Colors.grey; // اللون الثانوي
  static const Color accent = Colors.blue;

  static var primaryLight;

  static var primaryDark; // لون الزخرفة أو الإضافة
}

// فئة لتخزين الثوابت العامة في التطبيق
class AppConstants {
  static const String appName = 'Halal Lab Delivery'; // اسم التطبيق
}