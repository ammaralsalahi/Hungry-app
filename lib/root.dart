import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/featuers/auth/views/profile_view.dart';
import 'package:hungry/featuers/cart/views/cart_view.dart';
import 'package:hungry/featuers/home/views/home_view.dart';
import 'package:hungry/featuers/orderHistory/views/order_histroy_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller;

  late List<Widget> Screens;
  int currentScreen = 0;

  @override
  void initState() {
    Screens = [HomeView(), CartView(), OrderHistroyView(), ProfileView()];

    controller = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
      controller: controller,
      physics: NeverScrollableScrollPhysics(), 
      children: Screens,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: BottomNavigationBar(
          currentIndex: currentScreen,
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant_sharp),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: "Profile",
            ),
          ],
          onTap: (index) {
            setState(() => currentScreen = index);
            controller.jumpToPage(currentScreen);
          },
        ),
      ),
    );
  }
}
