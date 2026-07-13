import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/shared/custom_btn.dart';
import 'package:hungry/shared/custom_text.dart';

class OrderHistroyView extends StatelessWidget {
  const OrderHistroyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 140, top: 40),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/test/test.png",
                          width: 100,
                          // height: 200,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "text",
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              text: "quantity:x3",
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              text: "Price: 20\$",
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(10),
                    CustomBtn(
                      text: "Order Again",
                      color: Colors.grey.shade500,
                      width: double.infinity,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
