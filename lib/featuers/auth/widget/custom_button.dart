import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class CustomAuthBtn extends StatelessWidget {
  const CustomAuthBtn({
    super.key,
    this.onTap,
    required this.text,
    this.color,
    this.Textcolor,
  });

  final Function()? onTap;
  final String text;
  final Color? color;
  final Color? Textcolor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: CustomText(
            fontSize: 15,
            text: text,
            fontWeight: FontWeight.w800,
            color: Textcolor ?? AppColors.primary,
          ),
        ),
      ),
    );
  }
}
