import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';

class SearchFilled extends StatelessWidget {
  const SearchFilled({super.key});

  @override
  Widget build(BuildContext context) {
    return   Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(12),
                      shadowColor: Colors.grey,
                      child: TextField(
                        cursorColor: AppColors.primary,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'search.....',
                          prefixIcon: Icon(
                            CupertinoIcons.search,
                            color: AppColors.primary,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    );
  }
}