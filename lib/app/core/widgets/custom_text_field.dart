import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.onTap,
    this.readOnly,
    this.suffixIcon,
    this.maxLine,
  });

  final String hintText;
  final VoidCallback? onTap;
  final bool? readOnly;
  final Widget? suffixIcon;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly ?? false,
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.lineColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.lineColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.lineColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.blueColor),
        ),
      ),
      onTap: onTap,
    );
  }
}
