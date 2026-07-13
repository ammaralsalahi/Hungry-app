import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';

// ignore: must_be_immutable
class CustomTextformfield extends StatefulWidget {
  CustomTextformfield({
    super.key,
    required this.hint,
    required this.ispassword,
    required this.controller,
  });
  final String hint;
  final bool ispassword;
  TextEditingController controller = TextEditingController();

  @override
  State<CustomTextformfield> createState() => _CustomTextformfieldState();
}

class _CustomTextformfieldState extends State<CustomTextformfield> {
  late bool _obscureText;
  @override
  void initState() {
    _obscureText = widget.ispassword;
    super.initState();
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'please fill ${widget.hint}';
        }
        null;
        return null;
      },
      obscureText: _obscureText,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(color: AppColors.primary),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: widget.ispassword
            ? GestureDetector(
                onTap: _togglePassword,
                child: Icon(CupertinoIcons.eye, color: AppColors.primary),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}
