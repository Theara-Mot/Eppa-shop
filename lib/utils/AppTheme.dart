import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/AppColor.dart';
import 'AppTextTheme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.white,
    primaryColor: AppColor.dark,

    textTheme: AppTextTheme.getLightTextTheme(),
    useMaterial3: true,

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColor.error),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelStyle: AppTextTheme.getLightTextTheme().labelMedium?.copyWith(
        color: AppColor.medium,
      ),
      hintStyle: AppTextTheme.getLightTextTheme().bodyMedium,
      filled: true,
      fillColor: AppColor.light,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.black,
    primaryColor: AppColor.white,
    textTheme: AppTextTheme.getDarkTextTheme(),
    useMaterial3: true,
  );
}