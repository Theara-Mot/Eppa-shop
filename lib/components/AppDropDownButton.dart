import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/AppColor.dart';

class AppDropDownButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const AppDropDownButton({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    final isDarkMode = themeMode == Brightness.light;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 95.w,
      height: 32.h,
      padding: EdgeInsets.only(left: 16.w,top: 4.h,right: 4.w,bottom: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: isDarkMode?AppColor.light:AppColor.white10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(label,style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),),
          SizedBox(width: 8.w,),
          Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: isDarkMode?AppColor.white:AppColor.medium,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(icon, size: 10,color: isDarkMode?AppColor.black:AppColor.white,),
          ),
        ],
      ),
    );
  }
}
