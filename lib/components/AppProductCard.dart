import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/AppColor.dart';

class AppProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final Color? bgColor;

  const AppProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
        height: 220.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: bgColor ?? AppColor.extraLight, // Default to AppColor.extraLight if bgColor is null
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 144.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.h, left: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColor.black
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '\$$price',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                            color: AppColor.black
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 12.w,
              top: 12.h,
              child: Icon(
                Icons.bookmark_border,
                size: 24.sp,
                color: AppColor.dark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
