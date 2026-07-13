import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.text, this.onTap, this.width,  this.color, this.height});
  final String text;
  final Function()? onTap;
  final double? width;
  final Color? color;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color:color ?? AppColors.primary,
        ),
        child: Center(
          child: CustomText(text: text, fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
