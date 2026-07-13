import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

// ignore: must_be_immutable
class FoodCategory extends StatefulWidget {
  FoodCategory({
    super.key,
    required this.selectedIndex,
    required this.catageory,
  });
  late int selectedIndex = 0;
  final List catageory;
  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(widget.catageory.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  widget.selectedIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: widget.selectedIndex == index
                      ? AppColors.primary
                      : Color(0xfff3f4f6),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: CustomText(
                  text: widget.catageory[index],
                  fontWeight: FontWeight.w500,
                  color: widget.selectedIndex == index
                      ? Colors.white
                      : Colors.grey.shade600,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
