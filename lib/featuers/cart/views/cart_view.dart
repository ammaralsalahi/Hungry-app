import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/featuers/cart/widgets/cart_item.dart';
import 'package:hungry/featuers/checkout/views/checkout_view.dart';
import 'package:hungry/shared/custom_btn.dart';
import 'package:hungry/shared/custom_text.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final int itemCount = 20;
  late List<int> quantity;

  @override
  void initState() {
    quantity = List.generate(itemCount, (_) => 1);
    super.initState();
  }

  void onAdd(int index) {
    setState(() {
      quantity[index]++;
    });
  }

  void onRemove(int index) {
    setState(() {
      if (quantity[index] > 1) {
        quantity[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF8F8F8),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 140, top: 40),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CartItem(
                image: "assets/test/test.png",
                text: "Hamburger",
                desc: "Delicious beef burger",
                number: quantity[index],
                onAdd: () => onAdd(index),
                onRemove: () => onRemove(index),
              ),
            );
          },
        ),
      ),

      bottomSheet: Container(
        height: 110,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CustomText(text: "Total", fontSize: 20),
                  Gap(4),
                  CustomText(
                    text: "\$18.9",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              CustomBtn(
                text: "Check Out",
                height: 60,

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
