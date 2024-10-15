import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/AppColor.dart';

class SocialMediaButton extends StatelessWidget {
  final IconData? icon;
  final Function()? onPressed;
  final double? height; // Optional height parameter
  final double? iconSize; // Optional icon size parameter
  final String? image; // Optional image parameter
  final Color? bgColor; // Optional background color parameter
  final Color? iconColor; // Optional icon color parameter

  SocialMediaButton({
    super.key,
    this.icon,
    this.onPressed,
    this.height, // Optional height constructor
    this.iconSize, // Optional icon size constructor
    this.image, // Optional image constructor
    this.bgColor, // Optional background color constructor
    this.iconColor, // Optional icon color constructor
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = Theme.of(context).brightness;
    double buttonHeight = height ?? 48.h;
    double calculatedIconSize = iconSize ?? 24.h;
    Color buttonBgColor = bgColor ?? (themeMode == Brightness.light ? AppColor.medium20 : AppColor.white10); // Use bgColor if provided, else fallback to theme
    Color finalIconColor = iconColor ?? (themeMode == Brightness.light ? AppColor.black : AppColor.white); // Use iconColor if provided, else fallback to theme

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonBgColor,
        shape: const CircleBorder(),
        minimumSize: Size(buttonHeight, buttonHeight),
        padding: EdgeInsets.zero,
      ),
      child: image != null
          ? Image.asset(
        image!,
        width: calculatedIconSize,
        height: calculatedIconSize,
        fit: BoxFit.contain, // Ensure the image fits within the button
      )
          : Icon(
        icon,
        size: calculatedIconSize, // Use the calculated icon size
        color: finalIconColor, // Use the provided or fallback icon color
      ),
    );
  }
}
