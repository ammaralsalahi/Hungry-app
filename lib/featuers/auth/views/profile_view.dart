import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/featuers/auth/widget/custom_user_text.dart';
import 'package:hungry/shared/custom_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _AddressController = TextEditingController();

  @override
  void initState() {
    _NameController.text = "Alsalahi";
    _EmailController.text = "5Y4P8@example.com";
    _AddressController.text = "50 Yafa";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: SvgPicture.asset("assets/icons/settings.svg", width: 20),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                  //  image: DecorationImage(image: AssetImage("D:/flutterprojects/hung/hungry/assets/images/hero.jpg")),
                    border: Border.all(width: 5, color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Gap(40),
              CustomUserText(labeltext: "Name", controller: _NameController),
              Gap(25),
              CustomUserText(labeltext: "Email", controller: _EmailController),
              Gap(25),
              CustomUserText(
                labeltext: "Address",
                controller: _AddressController,
              ),
              Gap(20),
              Divider(height: 20),
              Gap(15),

              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                tileColor: Color(0xffF3F4F6),
                leading: Image.asset("assets/icons/profilevisa.png", width: 50),
                title: CustomText(text: "Debit card", color: Colors.black),
                subtitle: CustomText(
                  text: "3566 **** **** 0505",
                  color: Colors.grey.shade700,
                ),
                trailing: CustomText(text: "Default", color: Colors.black),
              ),
              Gap(120),
            ],
          ),
        ),
      ),

      bottomSheet: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CustomText(
                      text: "Edit profile",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    Gap(3),
                    Icon(Icons.edit, color: Colors.white),
                  ],
                ),
              ),
              Gap(20),
              Container(
                height: 60,
                width: 120,
                padding: EdgeInsets.symmetric(horizontal: 15),

                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2, color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CustomText(
                      text: "LOGOUT",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Gap(5),
                    Icon(Icons.logout, color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
