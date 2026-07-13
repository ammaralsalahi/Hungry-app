import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/featuers/products/widgets/spicy_slider.dart';
import 'package:hungry/featuers/products/widgets/topping_card.dart';
import 'package:hungry/shared/custom_btn.dart';
import 'package:hungry/shared/custom_text.dart';

class ProproductDetilesView extends StatefulWidget {
  const ProproductDetilesView({super.key});

  @override
  State<ProproductDetilesView> createState() => _ProproductDetilesViewState();
}

class _ProproductDetilesViewState extends State<ProproductDetilesView> {
  double value = 0.7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpicySlider(
                value: value,
                onChanged: (v) {
                  setState(() => value = v);
                  print(value);
                },
              ),

              Gap(20),
              CustomText(text: "Toppings", fontSize: 20),
              Gap(20),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(6, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: ToppingCard(
                          image: "assets/detail/tomato.png",
                          title: "Tomato",
                          onAdd: () {},
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Gap(20),
              CustomText(text: "Side options", fontSize: 20),
              Gap(20),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(6, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: ToppingCard(
                          image: "assets/detail/tomato.png",
                          title: "Tomato",
                          onAdd: () {},
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Gap(150),
            ],
          ),
        ),
      ),

      bottomSheet: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              blurRadius: 20,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(text: "Total", fontSize: 16),
                  CustomText(
                    text: "\$18.9",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              CustomBtn(text: "Add to cart", height: 60, onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
