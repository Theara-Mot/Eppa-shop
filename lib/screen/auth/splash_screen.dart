import 'package:eppa_shop/screen/auth/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../components/customButton.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index; // Update current page when swiped
                });
              },
              children: [
                Image.asset(
                  'assets/images/splash_bg1.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/splash_bg1.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/splash_bg1.png',
                  fit: BoxFit.cover,
                ),

              ],
            ),
          ),
          Positioned(
            top: 60.h,
            child: Image.asset(
              'assets/images/LOGO.png',
              height: 80,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(top: 60.h, left: 52.w, right: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    'Trend way \nwith Eppa',
                    style: textTheme.headlineLarge?.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    'Products that deserve you and\n open new doors and emotions',
                    style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(3, (index) => buildDot(index, context)),
                  ),
                  SizedBox(height: 40.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Navigate to login screen
                        },
                        child: Row(
                          children: [
                            Text(
                              'Login',
                              style: textTheme.bodyMedium?.copyWith(color: Colors.white),
                            ),
                            SizedBox(width: 8.w),
                            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12.sp),
                          ],
                        ),
                      ),
                      CustomButton(
                        text: 'Registration',
                        onTap: () {
                          Get.to(() => RegistrationScreen(), transition: Transition.rightToLeft);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      height: 4.h,
      width: _currentPage == index ? 16.w : 4.w,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}

