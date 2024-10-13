import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/AppColor.dart';

class AppBackButton extends StatelessWidget {
  final Future<void> Function()? onTap;
  final Icon? icon;

  const AppBackButton({Key? key, this.onTap, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    final defaultIcon = Icon(
      Icons.arrow_back_ios_outlined,
      color: themeMode == Brightness.light ? AppColor.black : AppColor.white,
      size: 16.sp,
    );

    return InkWell(
      onTap: () async {
        if (onTap != null) {
          await onTap!();
        } else {
          Get.back();
        }
      },
      child: Container(
        width: 36.w,
        height: 36.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: themeMode == Brightness.light ? AppColor.medium10 : AppColor.white20,
        ),
        child: icon ?? defaultIcon,
      ),
    );
  }
}
