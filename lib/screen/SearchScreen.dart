import 'dart:ui';

import 'package:eppa_shop/components/SocialMediaButton.dart';
import 'package:eppa_shop/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatelessWidget {
  final List<String> recentSearches = [
    'Baseball cap',
    'Jogers',
    'Wireless headphones',
    'Comics',
    'Manga'
  ];

  final List<Map<String, String>> popularSearches = [
    {'Nike': 'assets/images/search/nike.png'},
    {'Coat': 'assets/images/search/coat.png'},
    {'Backpack': 'assets/images/search/backpack.png'},
    {'The North Face': 'assets/images/search/hat.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final themeMode = Theme.of(context).brightness;
    final isDarkMode = themeMode == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72.h,
        title: Row(
          children: [
            Icon(Icons.arrow_back_ios,size: 24.sp,),
            SizedBox(width: 8.w,),
            Expanded(
              child: Container(
                height: 56.h,
                decoration: BoxDecoration(
                  color: isDarkMode?AppColor.extraLight:AppColor.white20,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 18.w,right: 8.w),
                      child: Icon(FontAwesomeIcons.search, color:isDarkMode?AppColor.black: AppColor.white80,size: 24.w,),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: false,
                          hintText: 'Search',
                          hintStyle: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700,color:isDarkMode?AppColor.black: AppColor.white80),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 52.w,right: 20.w),
              child: _buildRecentSearches(context),
            ),
            SizedBox(height: 60.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w,right: 20.w),
              child: _buildPopularSearches(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentSearches(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final themeMode = Theme.of(context).brightness;
    final isDarkMode = themeMode == Brightness.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          height: 64.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Searches',
                style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  height: 32.h,
                  width: 86.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color:isDarkMode?AppColor.light: AppColor.white10
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 24.h,
                        width: 24.h,
                        decoration: BoxDecoration(
                          color:isDarkMode?AppColor.white: AppColor.medium,
                          shape: BoxShape.circle, // Makes the container circular
                        ),
                        child: Icon(Icons.close, size: 16.sp), // You can adjust the size of the icon as needed
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Clear',
                        style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
          ,
        ),
        Column(
          children: recentSearches
              .map((search) => SizedBox(
                height: 48.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      search,
                      style:textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400,color:AppColor.medium),
                    ),
                    Icon(Icons.close, color:AppColor.medium,size: 12.sp,),
                  ],
                ),
              ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildPopularSearches(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final themeMode = Theme.of(context).brightness;
    final isDarkMode = themeMode == Brightness.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Searches',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20.h),
        GridView.builder(
          itemCount: popularSearches.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 1.5,
            crossAxisSpacing:11.w,
            mainAxisSpacing: 12.h,
          ),
          itemBuilder: (context, index) {
            String title = popularSearches[index].keys.first;
            String imageUrl = popularSearches[index].values.first;
            return SizedBox(
              height: 114.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1), // Adjust blur level as needed
                        child: Container(
                          color: AppColor.black40.withOpacity(0.4), // Black overlay with 40% opacity
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16.h,
                      left: 16.h,
                      right: 16.h,
                      child: Center(
                        child: Text(
                          title,
                          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700,color:AppColor.white)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

}
