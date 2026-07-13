import 'package:flutter/material.dart';

class CustomUserText extends StatelessWidget {
   const CustomUserText({super.key, required this.labeltext, required this.controller,
  });
 final String labeltext;
 final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return     TextField(
              controller: controller,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: labeltext,
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            );
  }
}