import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_project/core/di/module.dart';
import 'package:front_project/core/resources/app_color.dart';
import 'package:front_project/core/resources/app_icons.dart';
import 'package:front_project/core/resources/app_router.dart';
import 'package:front_project/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:front_project/util/extensions/context_extension.dart';

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

  void _navigate() {
    Timer(Duration(seconds: 3), () async {
      if (context.mounted) {
        if (await context.read<SplashCubit>().navigateToHome()) {
          context.navigateTo(Routes.home);
        } else {
          context.navigateReplacement(Routes.onboarding);
        }
      }
    });
  }
}
