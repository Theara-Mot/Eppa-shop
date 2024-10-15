import 'package:eppa_shop/screen/auth/splash_screen.dart';
import 'package:eppa_shop/utils/AppColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/AppTheme.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  bool isDarkMode = false;
  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }
  Widget buildCupertinoTextField(
      TextEditingController controller, String placeholder) {
    return Container(
      margin:const EdgeInsets.only(bottom: 5),
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    // final isDarkMode = themeMode == Brightness.light;
    final textTheme = Theme.of(context).textTheme;
    TextStyle style =
    TextStyle(fontWeight: FontWeight.w500, color: Colors.white);

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'Profile',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        actions: [
          Row(
            children: [
              Text(isDarkMode ? 'Dark Mode' : 'Light Mode'),
              CupertinoSwitch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                    Get.changeTheme(isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme);
                  });
                },
                activeColor: AppColor.dark,
              ),
            ],
          ),
          SizedBox(width: 20.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:AppColor.dark,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.asset('assets/images/me.png',
                            width: 70.w, height: 67.h, fit: BoxFit.cover),
                      ),
                      SizedBox(width: 15.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Theara Mot', style: style),
                          Text('thearamot@gmail.com', style: style),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:AppColor.medium,
                              ),
                              child: Text('Edit Profile', style: textTheme.bodyMedium),
                            ),
                          )),
                      SizedBox(width: 10.w),
                      Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:AppColor.medium,
                              ),
                              child: Text('Change Password', style: textTheme.bodyMedium),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.dark,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Information', style: style),
                  SizedBox(height: 10.h), // Updated to use ScreenUtil
                  _buildUserDetail('Name', 'Theara Mot'),
                  _buildUserDetail('Gender', 'Male'),
                  _buildUserDetail('Phone', '098765432'),
                  _buildUserDetail('DOB', 'Oct 15 2000'),
                  _buildUserDetail('Email', 'thearamot@gmail.com'),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text('Confirm Logout', style: textTheme.bodyMedium),
                      content: Text('Are you sure you want to log out?', style: textTheme.bodyMedium),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel', style: textTheme.bodyMedium),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => SplashScreen(), transition: Transition.rightToLeft);
                          },
                          child: Text('Logout', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.error80,
                ),
                child: Text('Logout', style: textTheme.bodyMedium?.copyWith(color: AppColor.white,fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserDetail(String label, String value) {
    final themeMode = Theme.of(context).brightness;
    final isDarkMode = themeMode == Brightness.light;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(8.w),
      margin: EdgeInsets.only(bottom: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isDarkMode ? AppColor.light : AppColor.white10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: textTheme.bodySmall),
          Text(value, style: textTheme.bodySmall),
        ],
      ),
    );
  }
}
