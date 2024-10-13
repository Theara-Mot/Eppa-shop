import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/AppColor.dart';

class AppTextField extends StatefulWidget {
  final bool? autoFocus;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final bool? enabled;

  AppTextField({
    Key? key,
    this.autoFocus,
    this.controller,
    this.hintText,
    this.labelText,
    this.isPassword = false,
    this.keyboardType,
    this.validator,
    this.onFieldSubmitted,
    this.onSaved,
    this.focusNode,
    this.textInputAction,
    this.onEditingComplete,
    this.onTap,
    this.onChanged,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.enabled,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    var themeMode = Theme.of(context).brightness;
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      autofocus: widget.autoFocus ?? false,
      controller: widget.controller,
      style: textTheme.bodyLarge?.copyWith(
        color: themeMode == Brightness.light ? AppColor.black : AppColor.white,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r), // Set the border radius here
          borderSide: BorderSide(color: Colors.transparent), // Make the border transparent
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r), // Set the border radius here
          borderSide: BorderSide(color: Colors.transparent), // Make the border transparent
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r), // Set the border radius here
          borderSide: BorderSide(color: Colors.transparent), // Make the border transparent
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r), // Set the border radius here
          borderSide: BorderSide(color: AppColor.error), // Make the border transparent
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: widget.labelText,
        labelStyle: textTheme.labelMedium?.copyWith(
          color: AppColor.medium,
        ),
        hintText: widget.hintText,
        hintStyle: textTheme.bodyMedium,
        filled: true,
        fillColor: themeMode == Brightness.light ? AppColor.light : AppColor.white10,
        suffixIcon: widget.isPassword != null && widget.isPassword == true
            ? IconButton(
                icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: isPasswordVisible ? AppColor.primary : null,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              )
            : null,
      ),
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      obscureText: widget.isPassword != null && widget.isPassword == true ? !isPasswordVisible : false,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
    );
  }
}