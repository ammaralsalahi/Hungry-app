import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.image, required this.text, required this.desc, this.onAdd, this.onRemove, required this.number});
 final String image;
final String text;
final String desc;
final int number;
final Function()? onAdd;
final Function()? onRemove;
  @override
  Widget build(BuildContext context) {
    return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          image,
                          width: 100,
                          // height: 200,
                        ),
                        CustomText(
                          text: text,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(text: desc),
                      ],
                    ),
                    //second bart
                    Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: onAdd,
                              child: CircleAvatar(
                                backgroundColor: AppColors.primary,
                                child: Icon(
                                  CupertinoIcons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Gap(20),
                            CustomText(
                              text: number.toString(),
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                            Gap(20),
                            GestureDetector(
                              onTap: onRemove,
                              child: CircleAvatar(
                                backgroundColor: AppColors.primary,
                                child: Icon(
                                  CupertinoIcons.minus,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(20),
                        Container(
                          width: 130,
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: CustomText(
                              text: "Remove",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}