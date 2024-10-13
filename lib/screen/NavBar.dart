import 'package:eppa_shop/components/AppBack.dart';
import 'package:eppa_shop/screen/CategoryScreen.dart';
import 'package:eppa_shop/screen/Home.dart';
import 'package:eppa_shop/screen/ProfileScreen.dart';
import 'package:eppa_shop/screen/SearchScreen.dart';
import 'package:eppa_shop/screen/WishListScreen.dart';
import 'package:eppa_shop/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(),
      Searchscreen(),
      Wishlistscreen(),
      CategoryScreen(),
      Profilescreen(),
    ];
    final themeMode = Theme.of(context).brightness;
    final isDarkMode = themeMode == Brightness.light;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Stack(
        children: [
          screens[_selectedIndex],
          Positioned(
            bottom: 36.h,
            left: 53.w,
            right: 20.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: isDarkMode?AppColor.dark:AppColor.white,
                    borderRadius: BorderRadius.circular(80),
                    border: Border.all(
                      color: Colors.lightBlue.withOpacity(0.2),
                      width: 1.5,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavItem(Icons.home, 0),
                      _buildNavItem(Icons.search, 1),
                      _buildNavItem(
                          FontAwesomeIcons.bagShopping, 2),
                      _buildNavItem(FontAwesomeIcons.solidBookmark,3),
                      _buildNavItem(Icons.admin_panel_settings, 4,imagePath:'assets/images/me.png'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, {String imagePath = ''}) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: imagePath.isNotEmpty
          ? Image.asset(
        imagePath,
        width: 24.sp, // Set your desired width
        height: 24.sp, // Set your desired height
      )
          : Icon(
        icon,
        size: 24.sp,
        color: _selectedIndex == index ? AppColor.secondary : AppColor.medium,
      ),
    );
  }


}
