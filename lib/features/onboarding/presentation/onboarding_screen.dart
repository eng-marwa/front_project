import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_project/core/constants/app_ui_constants.dart';
import 'package:front_project/core/resources/app_buttons_style.dart';
import 'package:front_project/core/resources/app_color.dart';
import 'package:front_project/core/resources/app_icons.dart';
import 'package:front_project/core/resources/app_router.dart';
import 'package:front_project/core/resources/app_style.dart';
import 'package:front_project/util/extensions/context_extension.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 24.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => context.navigateReplacement(Routes.home),
                  child: Text(
                    pageIndex < AppUiConstants.onboardingList.length - 1
                        ? 'Skip'
                        : '',
                    style: AppStyle.purple14Medium,
                  ),
                ),
              ),
              SizedBox(height: 15),
              SvgPicture.asset(
                AppUiConstants.onboardingList[pageIndex].imageAsset,
              ),
              SizedBox(height: 15),
              Text(
                AppUiConstants.onboardingList[pageIndex].title,
                textAlign: TextAlign.center,
                style: AppStyle.black12Color24Bold,
              ),
              SizedBox(height: 15),
              Text(
                AppUiConstants.onboardingList[pageIndex].description,
                textAlign: TextAlign.center,
                style: AppStyle.greyA6Color16Regular,
              ),
              SizedBox(height: 26),
              SizedBox(height: 26),
              // PrimaryButton(label: 'Continue', onPressed: () {}),
              ElevatedButton(
                onPressed: () {
                  if (pageIndex < AppUiConstants.onboardingList.length - 1) {
                    setState(() {
                      pageIndex++;
                    });
                  }else{
                    context.navigateReplacement(Routes.home);
                  }
                },
                style: AppButtonsStyle.primaryButtonStyle,
                child: Text(
                  pageIndex < AppUiConstants.onboardingList.length - 1
                      ? 'Continue'
                      : 'Get Started',
                  style: AppStyle.whiteColor16Bold,
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => context.navigateReplacement(Routes.login),
                style: AppButtonsStyle.secondaryButtonStyle,
                child: Text('Sign In', style: AppStyle.primaryColor16Bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
