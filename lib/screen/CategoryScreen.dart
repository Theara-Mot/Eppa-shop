import 'package:eppa_shop/components/AppDropDownButton.dart';
import 'package:eppa_shop/components/AppProductCard.dart';
import 'package:eppa_shop/components/SocialMediaButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/AppColor.dart';
class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final List<Map<String, String>> products = [
    {
      'imageUrl': 'glasses.png',
      'title': 'RAY-BAN 2180',
      'price': '149',
    },
    {
      'imageUrl': 'chain.png',
      'title': 'ALORISMAN',
      'price': '349',
    },
    {
      'imageUrl': 'bag.png',
      'title': 'ExoticLUX0',
      'price': '744',
    },
    {
      'imageUrl': 'watch.png',
      'title': 'VALTERA',
      'price': '249',
    },
    {
      'imageUrl': 'glasses.png',
      'title': 'RAY-BAN 2180',
      'price': '149',
    },
    {
      'imageUrl': 'chain.png',
      'title': 'ALORISMAN',
      'price': '349',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    final isDarkMode = themeMode == Brightness.light;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: isDarkMode?AppColor.primary10:AppColor.dark,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 281.h,
                width: double.infinity,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32.r),
                    bottomRight: Radius.circular(32.r),
                  ),
                  image:const DecorationImage(
                    image: AssetImage('assets/images/favourite/img.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 72.h,
                margin: EdgeInsets.only(top: 44.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialMediaButton(
                      height: 40.h,
                      iconColor:isDarkMode?AppColor.black: AppColor.white,
                      icon: Icons.arrow_back_ios,
                      iconSize: 12.sp,
                      onPressed: () {},
                      bgColor:isDarkMode? AppColor.white:AppColor.black, // Custom background color
                    ),
                    SocialMediaButton(
                      height: 40.h,
                      iconColor: AppColor.black,
                      icon: FontAwesomeIcons.search,
                      iconSize: 12.sp,
                      onPressed: () {},
                      bgColor: AppColor.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 23.h,
                left: 52.w,
                child: Text("LifeStyle", style: textTheme.displayLarge?.copyWith(color: AppColor.white,fontWeight: FontWeight.w700)),
              )
            ],
          ),
          Container(
            height: 64.h,
            padding: EdgeInsets.only(left: 52.w,top: 16.h,bottom: 16.h,right: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('24 of 240',style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),),
                Row(
                  children: [
                    const AppDropDownButton(
                      label: "New in",
                      icon: FontAwesomeIcons.angleDown,
                    ),
                    SizedBox(width: 12.w),
                    const AppDropDownButton(
                      label: "Filters",
                      icon: FontAwesomeIcons.angleDown,
                    ),
                  ],
                ),

              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(top: 8.h, left: 20.w, right: 20.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 11.w,
                childAspectRatio: 1 / 1.37,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return AppProductCard(
                  imageUrl:'assets/images/favourite/${product['imageUrl']!}',
                  title: product['title']!,
                  price: product['price']!,
                  bgColor: AppColor.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
