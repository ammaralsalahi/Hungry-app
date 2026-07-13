import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/featuers/checkout/widgets/order_details_widget.dart';
import 'package:hungry/featuers/checkout/widgets/succsess_dailoge.dart';
import 'package:hungry/shared/custom_btn.dart';
import 'package:hungry/shared/custom_text.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedmethod = 'cash';

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
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Order Summary",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              Gap(15),
              OrderDetailsWidget(
                order: "18.9",
                taxes: "3",
                deliveryFees: "18.3",
                total: "38.5",
              ),
              Gap(20),
              CustomText(
                text: "Payment Method",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              Gap(10),
              ListTile(
                onTap: () => setState(() => selectedmethod = "cash"),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                tileColor: Color(0xff3C2F2F),
                leading: Image.asset("assets/icons/cash.png", width: 50),
                title: CustomText(
                  text: "cash on delivery",
                  color: Colors.white,
                ),
                trailing: Radio<String>(
                  activeColor: Colors.white,
                  value: "cash",
                  groupValue: selectedmethod,
                  onChanged: (v) => setState(() => selectedmethod = v!),
                ),
              ),
              Gap(10),
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                tileColor: Colors.blue.shade900,
                leading: Image.asset("assets/icons/visa.png", width: 50),
                title: CustomText(text: "Debit card", color: Colors.white),
                subtitle: CustomText(
                  text: "3566 **** **** 0505",
                  color: Colors.grey.shade600,
                ),
                trailing: Radio<String>(
                  activeColor: Colors.white,

                  value: "visa",
                  groupValue: selectedmethod,
                  onChanged: (v) => setState(() => selectedmethod = v!),
                ),
                onTap: () => setState(() => selectedmethod = "visa"),
              ),
              Gap(5),
              Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xffEF2A39),
                    value: true,
                    onChanged: (v) {},
                  ),
                  CustomText(
                    text: "Save card details for future payments",
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
              Gap(200),
            ],
          ),
        ),
      ),

      bottomSheet: Container(
        height: 120,
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
                  CustomText(text: "Total", fontSize: 26),
                  CustomText(
                    text: "\$18.9",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              CustomBtn(
                text: "Pay Now",
                height: 60,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => SuccsessDailoge(),
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
