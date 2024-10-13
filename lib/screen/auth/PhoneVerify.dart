import 'package:country_code_picker/country_code_picker.dart';
import 'package:eppa_shop/components/AppBack.dart';
import 'package:eppa_shop/components/customButton.dart';
import 'package:eppa_shop/screen/Home.dart';
import 'package:eppa_shop/screen/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/AppColor.dart';

class PhoneVerifyScreen extends StatefulWidget {
  @override
  _PhoneVerifyScreenState createState() => _PhoneVerifyScreenState();
}

class _PhoneVerifyScreenState extends State<PhoneVerifyScreen> {
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    final isDarkMode = themeMode == Brightness.light;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 52.w,
            right: 20.w,
            top: 32.h,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackButton(),
              SizedBox(height: 40.h),
              Text(
                "Verification",
                style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter the 5-digit code sent to you at ",
                    style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400,color: Color(0xff8F92A1)),
                  ),
                  SizedBox(height: 4.h,),
                  Text(
                    "352-454-8623",
                    style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1', style: textTheme.displayLarge),
                  Text('0', style: textTheme.displayLarge),
                  Text('1', style: textTheme.displayLarge),
                  Text('0', style: textTheme.displayLarge),
                  Text('1', style: textTheme.displayLarge),
                ],
              ),


              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Resend code',
                    style: textTheme.titleSmall?.copyWith(color: AppColor.medium),
                  ),
                  CustomButton(
                    text: 'Next',
                    onTap: () {
                      Get.to(() => AppNavBar(), transition: Transition.rightToLeft);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
