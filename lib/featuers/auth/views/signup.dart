import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/featuers/auth/views/login.dart';
import 'package:hungry/featuers/auth/widget/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_textFormField.dart';

class Signupview extends StatelessWidget {
  const Signupview({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController namecontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: AppColors.primary,
      body: Column(
        children: [
          const Gap(120),

          /// Logo
          SvgPicture.asset("assets/logo/logo.svg", color: AppColors.primary),
          const CustomText(text: "Welcome to our  food app", fontSize: 16),

          const Gap(40),

          /// Container takes full width
          Expanded(
            child: Container(
              width: double.infinity, // ✅ يملأ العرض بالكامل
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Gap(30),

                    /// Name Field
                    CustomTextformfield(
                      hint: "Name",
                      ispassword: false,
                      controller: namecontroller,
                    ),
                    const Gap(10),

                    /// Email Field
                    CustomTextformfield(
                      hint: "Email address",
                      ispassword: false,
                      controller: emailcontroller,
                    ),
                    const Gap(10),

                    /// Password Field
                    CustomTextformfield(
                      hint: "Password",
                      ispassword: true,
                      controller: passwordcontroller,
                    ),
                    const Gap(20),

                    /// Sign up Button
                    CustomAuthBtn(
                      color: AppColors.primary,
                      text: "Sign up",
                      Textcolor: Colors.white,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          print("✅ Success register");
                        }
                      },
                    ),

                    const Gap(15),

                    /// Go to login
                    ///
                    CustomAuthBtn(
                      text: "go to login ",
                      Textcolor: AppColors.primary,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Loginview(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
