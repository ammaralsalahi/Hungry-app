import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/featuers/auth/views/signup.dart';
import 'package:hungry/featuers/auth/widget/custom_button.dart';
import 'package:hungry/root.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_textFormField.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Gap(120),

            /// Logo
            SvgPicture.asset("assets/logo/logo.svg", color: AppColors.primary),
            const CustomText(
              text: "Welcome back, discover fast food",
              fontSize: 16,
            ),

            const Gap(40),

            /// Colored Container (same as signup design)
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
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
                      const Gap(40),

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
                      const Gap(25),

                      /// Login Button
                      CustomAuthBtn(
                        color: Colors.white,
                        text: "Login",
                        Textcolor: AppColors.primary,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            print("✅ Login success");
                          }
                        },
                      ),

                      const Gap(15),

                      /// Go to signup
                      CustomAuthBtn(
                        text: "Create new account",
                        color: Colors.transparent,
                        Textcolor: Colors.white,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signupview(),
                            ),
                          );
                        },
                      ),

                      //as a guest
                      Gap(10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Root(),
                            ),
                          );
                        },
                        child: CustomText(
                          text: "Continue as a guest ?",
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
