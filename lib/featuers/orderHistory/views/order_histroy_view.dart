
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/shared/custom_btn.dart';
import 'package:hungry/shared/custom_text.dart';

class OrderHistroyView extends StatelessWidget {
  const OrderHistroyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FA),

      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFF8F8FA),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(14, 24, 14, 150),
        itemCount: 3,

        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),

              border: Border.all(
                color: const Color(0xFFEEEEEE),
                width: 1,
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.035),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),

            child: Padding(
              padding: const EdgeInsets.all(14),

              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),

                        child: Container(
                          width: 100,
                          height: 100,
                          color: const Color(0xFFFFF3EA),

                          child: Image.asset(
                            'assets/test/test.png',
                            fit: BoxFit.cover,

                            errorBuilder: (
                              context,
                              error,
                              stackTrace,
                            ) {
                              return const Center(
                                child: Icon(
                                  Icons.fastfood_rounded,
                                  size: 42,
                                  color: Color(0xFFE86A33),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Delicious Meal',
                              fontWeight: FontWeight.bold,
                            ),

                            const Gap(10),

                            Row(
                              children: [
                                const Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 16,
                                  color: Colors.grey,
                                ),

                                const SizedBox(width: 6),

                                Flexible(
                                  child: CustomText(
                                    text: 'Quantity: x3',
                                  ),
                                ),
                              ],
                            ),

                            const Gap(8),

                            Row(
                              children: [
                                const Icon(
                                  Icons.payments_outlined,
                                  size: 16,
                                  color: Color(0xFFE86A33),
                                ),

                                const SizedBox(width: 6),

                                Flexible(
                                  child: CustomText(
                                    text: r'Price: $20',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const Gap(16),

                  SizedBox(
                    width: double.infinity,
                    child: CustomBtn(
                      text: 'Order Again',
                      color: const Color(0xFFE86A33),
                      width: double.infinity,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
