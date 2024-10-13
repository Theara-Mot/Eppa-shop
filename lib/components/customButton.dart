import 'package:eppa_shop/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeMode = Theme.of(context).brightness;
    bool isDarkMode = themeMode == Brightness.dark;
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: !isDarkMode ? AppColor.dark : AppColor.light, // Adjust background color for dark mode
          borderRadius: BorderRadius.circular(30.r),
        ),
        padding: EdgeInsets.only(left: 30.w,right: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: textTheme.bodyMedium?.copyWith(color: !isDarkMode?AppColor.light:AppColor.dark,fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.w),
            CircleAvatar(
              backgroundColor:isDarkMode? AppColor.dark.withOpacity(0.1):AppColor.light.withOpacity(0.1),
              child: Icon(Icons.arrow_forward_ios, color:isDarkMode? AppColor.dark:AppColor.light, size: 14.sp), // Icon with color and size
            ),
          ],
        ),
      ),
    );
  }
}
