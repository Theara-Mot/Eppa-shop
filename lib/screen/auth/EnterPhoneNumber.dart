import 'package:country_code_picker/country_code_picker.dart';
import 'package:eppa_shop/components/AppBack.dart';
import 'package:eppa_shop/components/customButton.dart';
import 'package:eppa_shop/screen/auth/PhoneVerify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/AppColor.dart';

class EnterPhoneNumber extends StatefulWidget {
  @override
  _EnterPhoneNumberState createState() => _EnterPhoneNumberState();
}

class _EnterPhoneNumberState extends State<EnterPhoneNumber> {
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
                "Enter phone number",
                style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 16.h),
              Text(
                "You will be sent SMS to the entered number\nand you can use the application",
                style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 40.h),
              Card(
                elevation: 0,
                color:isDarkMode?AppColor.light:AppColor.white20,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Row(
                    children: [
                      Center(
                        child: Image.asset('assets/images/phone.png', width: 24.w),
                      ),
                      CountryCodePicker(
                        onChanged: print,
                        initialSelection: 'CAM',
                        favorite: ['+855', 'CAM'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                        showFlag: false,
                        textStyle: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color:AppColor.primary,
                        ),
                        dialogBackgroundColor: !isDarkMode ? AppColor.dark : AppColor.light,
                      ),
                      Expanded(
                        child: TextField(
                          controller: pinController,
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: isDarkMode ? AppColor.dark : AppColor.light,
                          ),
                          decoration: InputDecoration(
                            filled: false,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            hintText: '352-454-8623',
                            hintStyle: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    text: 'Next',
                    onTap: () {
                      Get.to(() => PhoneVerifyScreen(), transition: Transition.rightToLeft);
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
