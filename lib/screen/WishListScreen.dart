import 'package:eppa_shop/components/SocialMediaButton.dart';
import 'package:eppa_shop/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistScreen extends StatelessWidget {
  final List<Map<String, dynamic>> wishlistItems = [
    {'title': 'Hat-bini The North Face', 'color': 'Black', 'price': 32},
    {'title': 'Dr Martens Jadon', 'color': 'Black / EU 43', 'price': 245},
    {'title': 'Skinny joggers', 'color': 'Black', 'price': 30},
    {'title': 'Fake fur denim jacket', 'color': 'Black', 'price': 65},
    {'title': 'Versace Jeans', 'color': 'White', 'price': 793},
    {'title': 'Long cardigan', 'color': 'Black', 'price': 84},
    {'title': 'Versace Jeans', 'color': 'White', 'price': 793},
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final themeMode = Theme.of(context).brightness;
    final isDarkMode = themeMode == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        title:Row(
          children: [
            Text('Wishlist '),
            Text(' ${wishlistItems.length} ',)
          ],
        ),
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: (){},
            child: Container(
              height: 36.h,
              width: 36.w,
              decoration: BoxDecoration(
                color: AppColor.error20,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.delete,
                size: 12.sp,
                color: AppColor.error80, // Change the icon color as needed
              ),
            ),
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: (){},
            child: Container(
              height: 36.h,
              width: 36.w,
              decoration: BoxDecoration(
                color:isDarkMode?AppColor.black: AppColor.white10,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                size: 12.sp,
                color: Colors.white, // Change the icon color as needed
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.builder(
          itemCount: wishlistItems.length,
          itemBuilder: (context, index) {
            final item = wishlistItems[index];
            return Container(
              margin: EdgeInsets.only(bottom: 12.h),
              height: 88.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 88.h,
                    width: 72.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r), // Circular border radius
                      image: DecorationImage(
                        image: AssetImage('assets/images/search/hat.png'), // Use AssetImage for local images
                        fit: BoxFit.cover, // Adjust the image to cover the container
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'],
                          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700)
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          item['color'],
                          style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700,color: AppColor.medium),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '\$${item['price']}',
                          style:  textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: 36.h,
                          width: 36.w,
                          decoration: BoxDecoration(
                            color: AppColor.error20,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.delete,
                            size: 12.sp,
                            color: AppColor.error80, // Change the icon color as needed
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: 36.h,
                          width: 36.w,
                          decoration: BoxDecoration(
                            color:isDarkMode?AppColor.black: AppColor.white10,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 12.sp,
                            color: Colors.white, // Change the icon color as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

