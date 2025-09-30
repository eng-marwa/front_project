import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_project/presentation/common_widgets/primary_button.dart';
import 'package:front_project/presentation/resources/app_buttons_style.dart';
import 'package:front_project/presentation/resources/app_color.dart';
import 'package:front_project/presentation/resources/app_icons.dart';
import 'package:front_project/presentation/resources/app_style.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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
                  onPressed: () {},
                  child: Text('Skip', style: AppStyle.purple14Medium),
                ),
              ),
              SizedBox(height: 15),
              SvgPicture.asset(AppIcons.onboarding1),
              SizedBox(height: 15),
              Text(
                'Now reading books will be easier',
                textAlign: TextAlign.center,
                style: AppStyle.black12Color24Bold,
              ),
              SizedBox(height: 15),
              Text(
                ' Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.',
                textAlign: TextAlign.center,
                style: AppStyle.greyA6Color16Regular,
              ),
              SizedBox(height: 26),
              SizedBox(height: 26),
              // PrimaryButton(label: 'Continue', onPressed: () {}),
              ElevatedButton(onPressed: (){}, child: Text('Continue',style: AppStyle.whiteColor16Bold,),style: AppButtonsStyle.primaryButtonStyle,)
            ],
          ),
        ),
      ),
    );
  }
}
