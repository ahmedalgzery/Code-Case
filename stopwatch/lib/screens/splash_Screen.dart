// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:stopwatch/screens/home_screen.dart';
import 'package:stopwatch/widgets/sliding_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initAnimations();
    navigateToHomeScreen();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF352F44),
      body: Center(child: SlidingText(slidingAnimation: slidingAnimation)),
    );
  }

  void initAnimations() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, -3),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void navigateToHomeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }
}
