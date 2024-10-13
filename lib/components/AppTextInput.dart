import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/AppColor.dart';

Widget AppTextInput(BuildContext context, String label, String value, {bool isPassword = false}) {
  var textTheme = Theme.of(context).textTheme;
  bool _obscureText = isPassword;
  var themeMode = Theme.of(context).brightness;
  bool isDarkMode = themeMode == Brightness.dark;

  return StatefulBuilder(
    builder: (context, setState) {
      return Card(
        color:isDarkMode? AppColor.white10:AppColor.light,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 12.w), // Adjust padding for vertical alignment
          child: Stack(
            children: [
              TextFormField(
                initialValue: value,
                obscureText: _obscureText, // Hide text if it's a password field
                style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  labelText: label,
                  labelStyle: textTheme.bodyLarge?.copyWith(color: AppColor.medium,fontWeight: FontWeight.w700),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(left: 12.w,right: 12.w,top: 16.h,bottom: 8.h),
                ),
              ),
              // Icon aligned to the center-right
              if (isPassword)
                Align(
                  alignment: Alignment.centerRight, // Center-right alignment
                  child: Padding(
                    padding: EdgeInsets.only(right: 12.w), // Adjust padding for alignment
                    child: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: AppColor.medium,
                        size: 24.sp,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText; // Toggle the obscureText value
                        });
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    },
  );
}
