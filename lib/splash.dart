import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/featuers/auth/views/login.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeLogo;
  late Animation<double> _scaleLogo;
  late Animation<Offset> _slideImage;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _fadeLogo = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    );

    _scaleLogo = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _slideImage = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
          ),
        );

    // 🔥 هنا السحر
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // بعد ما يخلص الأنيميشن تمامًا، ينتقل لصفحة Root
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (_, __, ___) => const Loginview(),
            transitionsBuilder: (_, animation, __, child) =>
                FadeTransition(opacity: animation, child: child),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Gap(100),
            FadeTransition(
              opacity: _fadeLogo,
              child: ScaleTransition(
                scale: _scaleLogo,
                child: SvgPicture.asset("assets/logo/logo.svg"),
              ),
            ),
            const Spacer(),
            SlideTransition(
              position: _slideImage,
              child: Image.asset("assets/splash/sp.png"),
            ),
          ],
        ),
      ),
    );
  }
}
