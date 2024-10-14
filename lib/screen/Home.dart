import 'package:eppa_shop/components/AppProductCard.dart';
import 'package:eppa_shop/components/SocialMediaButton.dart';
import 'package:eppa_shop/utils/AppColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    final isDarkMode = themeMode == Brightness.light;
    final textTheme = Theme.of(context).textTheme;
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 72,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Menu',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
                    Row(
                      children: [
                        Text('Scan',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
                        SizedBox(width: 8.w,),
                        GestureDetector(
                          child: Image.asset(
                            'assets/images/scan_${isDarkMode ? 'dark' : 'light'}.png',
                            width: 24.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 8.h,),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.light,
                  borderRadius: BorderRadius.circular(16.r)
                ),
                // padding: EdgeInsets.all(16.sp),
                height: 200.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    // Background image
                    Image.asset(
                      'assets/images/hat.png', // Replace with your image path
                      width: double.infinity,
                      height: 172.h,
                      fit: BoxFit.contain, // Adjust to your preference (e.g., BoxFit.fill, BoxFit.contain)
                    ),

                    // Overlay text and icon on top of the image
                    Positioned(
                      bottom: 16.h, // Adjust based on where you want to position the row
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
                                'New in ORIGINALS', // Replace with your desired text
                                style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700)
                              ),
                              Text(
                                  'RIVALRY LO SUPERSTAR', // Replace with your desired text
                                  style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700)
                              ),

                            ],
                          ),
                          SocialMediaButton(
                            icon: Icons.play_arrow,
                            onPressed: () {},
                            bgColor: AppColor.white, // Custom background color
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
                  Text('All',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
                ],
              ),
              SizedBox(height: 20.h,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 20.w), // Adjust spacing between avatars
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 64, // Adjust the size of the CircleAvatar
                            backgroundImage: AssetImage('assets/images/splash_bg1.png'), // Your image asset
                          ),
                          SizedBox(height: 12), // Space between CircleAvatar and Text
                          Text(
                            'Accessories $index', // Dynamic text for each item
                            style: textTheme.bodyMedium, // Text style
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 32.h,),
              Text('Recommended For You',style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
              SizedBox(height: 20.h,),
              Row(
                children: [
                  AppProductCard(
                    imageUrl: 'assets/images/glasses.png',
                    title: 'RAY-BAN 2180',
                    price: '149',
                  ),
                  SizedBox(width: 11.w,),
                  AppProductCard(
                    imageUrl: 'assets/images/watch.png',
                    title: 'BOSS Ocean',
                    price: '101',
                    bgColor: Color(0xffEAE8E9),
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
            ],
          ),
        ),
      ),
    );
  }
}
