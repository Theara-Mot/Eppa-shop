import 'package:eppa_shop/components/AppProductCard.dart';
import 'package:eppa_shop/components/SocialMediaButton.dart';
import 'package:eppa_shop/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> accessories = [
    {"image": "c-accessories.png", "name": "Acessories"},
    {"image": "c-shirts.png", "name": "Shirts"},
    {"image": "c-shoes.png", "name": "Shoes"},
    {"image": "c-outlet.png", "name": "Outlet"},
    {"image": "c-sports.png", "name": "Sports"},
  ];

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    final isDarkMode = themeMode == Brightness.light;
    final textTheme = Theme.of(context).textTheme;
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  height: 72.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Menu',style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),),
                      Row(
                        children: [
                          Text('Scan',style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),),
                          SizedBox(width: 8.w,),
                          GestureDetector(
                            child: Image.asset(
                              'assets/images/scan_${isDarkMode ? 'dark' : 'light'}.png',
                              width: 24.w,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.light,
                    borderRadius: BorderRadius.circular(16.r)
                  ),
                  // padding: EdgeInsets.all(16.sp),
                  height: 200.h,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/shoes.png',
                        width: double.infinity,
                        height: 172.h,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        bottom: 16.h,
                        left: 16.w,
                        right: 16.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text widget
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'New in ORIGINALS',
                                  style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700,color: AppColor.dark)
                                ),
                                Text(
                                    'RIVALRY LO SUPERSTAR',
                                    style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700,color: AppColor.black)
                                ),

                              ],
                            ),
                            SocialMediaButton(
                              iconColor: AppColor.black,
                              icon: Icons.play_arrow,
                              onPressed: () {},
                              bgColor: AppColor.white,
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Categories',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
                    Text('All',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(accessories.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Column(
                        children: [
                          Container(
                            width: 64.w,
                            height: 64.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/categories/${accessories[index]['image']!}'), // Access image from the list
                                fit: BoxFit.cover, // Make sure the image covers the entire container
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            accessories[index]['name']!,
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 32.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text('Recommended For You',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    const AppProductCard(
                      imageUrl: 'assets/images/glasses.png',
                      title: 'RAY-BAN 2180',
                      price: '149',
                    ),
                    SizedBox(width: 11.w,),
                    const AppProductCard(
                      imageUrl: 'assets/images/watch.png',
                      title: 'BOSS Ocean',
                      price: '101',
                      bgColor: Color(0xffEAE8E9),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
            ],
          ),
        ),
      ),
    );
  }
}
