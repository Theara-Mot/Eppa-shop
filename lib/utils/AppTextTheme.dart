import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AppColor.dart';

class AppTextTheme {
  static final primaryFont = GoogleFonts.overpass();

  static TextTheme getLightTextTheme() {
    return TextTheme(
      displayLarge: primaryFont.copyWith(fontSize: 60.sp, fontWeight: FontWeight.bold, color: AppColor.black),
      displayMedium: primaryFont.copyWith(fontSize: 57.sp, fontWeight: FontWeight.normal, color: AppColor.black),
      displaySmall: primaryFont.copyWith(fontSize: 45.sp, fontWeight: FontWeight.normal, color: AppColor.black),
      headlineLarge: primaryFont.copyWith(fontSize: 36.sp, fontWeight: FontWeight.normal, color: AppColor.black),
      headlineMedium: primaryFont.copyWith(fontSize: 32.sp, fontWeight: FontWeight.normal, color: AppColor.black),
      headlineSmall: primaryFont.copyWith(fontSize: 24.sp, fontWeight: FontWeight.normal, color: AppColor.black),
      titleLarge: primaryFont.copyWith(fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColor.black),
      titleMedium: primaryFont.copyWith(fontSize: 18.sp, fontWeight: FontWeight.normal, color: AppColor.black),
      titleSmall: primaryFont.copyWith(fontSize: 16.sp, fontWeight: FontWeight.normal, color: AppColor.black),
      labelLarge: primaryFont.copyWith(fontSize: 14.sp, fontWeight: FontWeight.normal, color: AppColor.black),
      labelMedium: primaryFont.copyWith(fontSize: 12.sp, fontWeight: FontWeight.normal, color: AppColor.black),
      labelSmall: primaryFont.copyWith(fontSize: 11.sp, fontWeight: FontWeight.normal, color: AppColor.black),
      bodyLarge: primaryFont.copyWith(fontSize: 16.sp, fontWeight: FontWeight.normal, color: AppColor.black),
      bodyMedium: primaryFont.copyWith(fontSize: 14.sp, fontWeight: FontWeight.normal, color: AppColor.black),
      bodySmall: primaryFont.copyWith(fontSize: 12.sp, fontWeight: FontWeight.normal, color: AppColor.black),
    );
  }

  static TextTheme getDarkTextTheme() {
    return TextTheme(
      displayLarge: primaryFont.copyWith(fontSize: 60.sp, fontWeight: FontWeight.normal, color: AppColor.white),
      displayMedium: primaryFont.copyWith(fontSize: 57.sp, fontWeight: FontWeight.normal, color: AppColor.white),
      displaySmall: primaryFont.copyWith(fontSize: 45.sp, fontWeight: FontWeight.normal, color: AppColor.white),
      headlineLarge: primaryFont.copyWith(fontSize: 36.sp, fontWeight: FontWeight.normal, color: AppColor.white),
      headlineMedium: primaryFont.copyWith(fontSize: 32.sp, fontWeight: FontWeight.normal, color: AppColor.white),
      headlineSmall: primaryFont.copyWith(fontSize: 24.sp, fontWeight: FontWeight.normal, color: AppColor.white),
      titleLarge: primaryFont.copyWith(fontSize: 22.sp, fontWeight: FontWeight.normal, color: AppColor.white),
      titleMedium: primaryFont.copyWith(fontSize: 18.sp, fontWeight: FontWeight.normal, color: AppColor.white),
      titleSmall: primaryFont.copyWith(fontSize: 16.sp, fontWeight: FontWeight.normal, color: AppColor.white),
      labelLarge: primaryFont.copyWith(fontSize: 14.sp, fontWeight: FontWeight.normal, color: AppColor.white),
      labelMedium: primaryFont.copyWith(fontSize: 12.sp, fontWeight: FontWeight.normal, color: AppColor.white),
      labelSmall: primaryFont.copyWith(fontSize: 11.sp, fontWeight: FontWeight.normal, color: AppColor.white),
      bodyLarge: primaryFont.copyWith(fontSize: 16.sp, fontWeight: FontWeight.normal, color: AppColor.white),
      bodyMedium: primaryFont.copyWith(fontSize: 14.sp, fontWeight: FontWeight.normal, color: AppColor.white),
      bodySmall: primaryFont.copyWith(fontSize: 12.sp, fontWeight: FontWeight.normal, color: AppColor.white),
    );
  }
}