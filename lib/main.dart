
import 'package:eppa_shop/screen/Home.dart';
import 'package:eppa_shop/screen/NavBar.dart';
import 'package:eppa_shop/screen/SearchScreen.dart';
import 'package:eppa_shop/screen/WishListScreen.dart';
import 'package:eppa_shop/screen/auth/EnterPhoneNumber.dart';
import 'package:eppa_shop/screen/auth/PhoneVerify.dart';
import 'package:eppa_shop/screen/auth/registration.dart';
import 'package:eppa_shop/screen/auth/splash_screen.dart';
import 'package:eppa_shop/utils/AppController.dart';
import 'package:eppa_shop/utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AppController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'EPPA SHOP',
          // theme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: WidgetsBinding.instance.window.platformBrightness == Brightness.light ? ThemeMode.light : ThemeMode.dark,
          home: child,
        );
      },
      child: WishlistScreen(),
    );
  }
}