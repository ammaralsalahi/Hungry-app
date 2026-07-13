import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/shared/custom_text.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    super.key,
    required this.order,
    required this.taxes,
    required this.deliveryFees,
    required this.total,
  });

  final String order;
  final String taxes;
  final String deliveryFees;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        checkoutWidget("Order", order, false, false),
        Gap(10),
        checkoutWidget("Taxes", taxes, false, false),
        Gap(10),
        checkoutWidget("Delivery Fees", deliveryFees, false, false),
        Divider(),
        Gap(10),
        checkoutWidget("Total", total, true, false),
        Gap(10),
        checkoutWidget("Estimated Delivery Time", "15-30 min", true, true),
      ],
    );
  }
}

Widget checkoutWidget(Title, price, isbold, issmall) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        text: Title,
        fontSize: issmall ? 12 : 15,
        fontWeight: isbold ? FontWeight.bold : FontWeight.w400,
        color: isbold ? Colors.black : Colors.grey.shade800,
      ),
      CustomText(
        text: '$price \$',
        fontSize: issmall ? 12 : 15,
        fontWeight: isbold ? FontWeight.bold : FontWeight.w400,
        color: isbold ? Colors.black : Colors.grey.shade800,
      ),
    ],
  );
}
