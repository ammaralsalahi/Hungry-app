import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class SpicySlider extends StatefulWidget {
  const SpicySlider({super.key, required this.value, required this.onChanged});
  final double value;
  final ValueChanged<double> onChanged;

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/detail/sandwich.png", height: 200),
        Spacer(),
        Column(
          children: [
            CustomText(
              text:
                  "Customize Your Burger\n to Your Tastes. Ultimate \n Experience",
            ),
            Slider(
              min: 0,
              max: 1,
              value: widget.value,
              onChanged: widget.onChanged,
              activeColor: AppColors.primary,
              inactiveColor: Colors.grey[300],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "🍧"),
                Gap(100),
                CustomText(text: "🌶"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
