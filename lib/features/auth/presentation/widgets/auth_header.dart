import 'package:flutter/material.dart';
import 'package:front_project/core/resources/app_style.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.label,
    required this.description,
    this.isCenter = false,
  });

  final String label;
  final String description;
  final bool? isCenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyle.black12Color24Bold,textAlign: isCenter==true?TextAlign.center:TextAlign.start,),
        const SizedBox(height: 5),
        Text(description, style: AppStyle.greyA6Color16Regular, textAlign: isCenter==true?TextAlign.center:TextAlign.start,),
      ],
    );
  }
}
