import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_project/presentation/features/onboarding_screen.dart';
import 'package:front_project/presentation/resources/app_color.dart';
import 'package:front_project/presentation/resources/app_icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _navigate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(child: SvgPicture.asset(AppIcons.logo)),
    );
  }

  void _navigate(){
    Timer(Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingScreen(),));
    });
  }
}
