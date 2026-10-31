
import 'dart:ui';

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
  late final PageController controller;

  final List<Widget> screens = [
    HomeView(),
    CartView(),
    OrderHistroyView(),
    ProfileView(),
  ];

  int currentScreen = 0;

  final List<_NavItem> navItems = const [
    _NavItem(
      icon: CupertinoIcons.house_fill,
      activeIcon: CupertinoIcons.house_fill,
      label: 'Home',
    ),
    _NavItem(
      icon: CupertinoIcons.cart,
      activeIcon: CupertinoIcons.cart_fill,
      label: 'Cart',
    ),
    _NavItem(
      icon: CupertinoIcons.doc_text,
      activeIcon: CupertinoIcons.doc_text_fill,
      label: 'Orders',
    ),
    _NavItem(
      icon: CupertinoIcons.person,
      activeIcon: CupertinoIcons.person_fill,
      label: 'Profile',
    ),
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  void onItemTapped(int index) {
    if (index == currentScreen) return;

    setState(() {
      currentScreen = index;
    });

    controller.jumpToPage(index);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.primary;

    return Scaffold(
      extendBody: true,

      body: Padding(
        padding: const EdgeInsets.only(bottom: 110),
        child: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: screens,
        ),
      ),

      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 8,
              sigmaY: 8,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 9,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF202020).withValues(alpha: 0.82),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.16),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.20),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: List.generate(
                  navItems.length,
                  (index) {
                    final item = navItems[index];
                    final selected = currentScreen == index;

                    return Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => onItemTapped(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutCubic,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 3,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 7,
                            horizontal: 2,
                          ),
                          decoration: BoxDecoration(
                            color: selected
                                ? primary.withValues(alpha: 0.15)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOutBack,
                                width: selected ? 49 : 42,
                                height: selected ? 43 : 39,
                                decoration: BoxDecoration(
                                  gradient: selected
                                      ? LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            primary,
                                            primary.withValues(alpha: 0.78),
                                          ],
                                        )
                                      : null,
                                  color: selected
                                      ? null
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: selected
                                      ? [
                                          BoxShadow(
                                            color: primary.withValues(alpha: 0.32),
                                            blurRadius: 15,
                                            offset: const Offset(0, 4),
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Center(
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 180),
                                    transitionBuilder: (child, animation) {
                                      return ScaleTransition(
                                        scale: animation,
                                        child: child,
                                      );
                                    },
                                    child: Icon(
                                      selected
                                          ? item.activeIcon
                                          : item.icon,
                                      key: ValueKey('$index-$selected'),
                                      size: selected ? 23 : 22,
                                      color: selected
                                          ? Colors.white
                                          : Colors.white.withValues(alpha: 0.62),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 250),
                                style: TextStyle(
                                  color: selected
                                      ? primary
                                      : Colors.white.withValues(alpha: 0.65),
                                  fontSize: selected ? 11 : 10,
                                  fontWeight: selected
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                ),
                                child: Text(
                                  item.label,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 4),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                width: selected ? 15 : 0,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: selected
                                      ? primary
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}
