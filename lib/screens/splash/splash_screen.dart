import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillersoft/screens/intro/intro_screen.dart';
import 'package:pillersoft/utilities/assets_paths/assets_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Get.to(() => IntroScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(ImagePath.splash))),
      ),
    );
  }
}
