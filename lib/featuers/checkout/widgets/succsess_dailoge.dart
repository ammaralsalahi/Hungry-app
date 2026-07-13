import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_btn.dart';
import 'package:hungry/shared/custom_text.dart';

class SuccsessDailoge extends StatelessWidget {
  const SuccsessDailoge({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primary,
              radius: 40,
              child: const Icon(
                CupertinoIcons.checkmark_alt,
                color: Colors.white,
                size: 45,
              ),
            ),
            const Gap(20),
            const CustomText(
              text: "Success!",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            const Gap(8),
            const CustomText(
              text: "Your payment was successful",
              color: Colors.grey,
            ),
            const CustomText(
              text: "A receipt has been \n sent to your email.",
              color: Colors.grey,
            ),
            const Gap(20),
            CustomBtn(text: "Close", onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}
