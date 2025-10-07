import 'package:flutter/material.dart';
import 'package:front_project/core/resources/app_style.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({super.key, required this.originalText, required this.linkText, required this.onTap});
  final String originalText;
  final String linkText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Text.rich(TextSpan(text: originalText,style: AppStyle.greyA6Color16Regular,children: [
        TextSpan(text: linkText,style: AppStyle.primaryColor16Bold,)
      ]),textAlign: TextAlign.center,),
    );
  }
}
