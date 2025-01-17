import 'package:eppa_shop/components/AppTextInput.dart';
import 'package:eppa_shop/components/customButton.dart';
import 'package:eppa_shop/screen/auth/PhoneVerify.dart';
import 'package:eppa_shop/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../../components/SocialMediaButton.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeMode = Theme.of(context).brightness;
    bool isDarkMode = themeMode == Brightness.light;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 52.w,top: 16.h,right: 20.w,bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/${isDarkMode?'img_1':'LOGO'}.png',
                  height: 44.h,
                ),
                SocialMediaButton(icon: Icons.close,height: 36.w,iconSize: 12.w,),
              ],
            ),
            SizedBox(height: 40.h),
            Text(
              'Create Account',
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                SocialMediaButton(icon: Icons.apple),
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: SocialMediaButton(
                    image:isDarkMode? 'assets/images/google_dark.png':'assets/images/google_light.png', // Use image
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: SocialMediaButton(
                    image:isDarkMode? 'assets/images/facebook_dark.png':'assets/images/facebook_light.png', // Use image
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.h),
            Text(
              'Or with Email',
              style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 32.h),
            AppTextInput(context,'Email', 'xander_shop@gmail.com'),
            SizedBox(height: 12.h),
            AppTextInput(context, 'Name', 'Alex', isPassword: false),
            SizedBox(height: 12.h),
            AppTextInput(context, 'Password', 'You see everything', isPassword: true),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'I agree with ',
                      style: textTheme.bodyMedium?.copyWith(color:isDarkMode?AppColor.medium:AppColor.light ,fontWeight: FontWeight.w700)
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: Text(
                        'Terms of Use',
                        style: textTheme.bodyMedium?.copyWith(color: Colors.purpleAccent,fontWeight: FontWeight.w700,),
                      ),
                    ),
                  ],
                ),
                CustomButton(text: 'Sign Up', onTap: (){
                  Get.to(() => PhoneVerifyScreen(), transition: Transition.rightToLeft);
                })
              ],
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

}
