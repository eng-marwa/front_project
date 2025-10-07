import 'package:flutter/material.dart';
import 'package:front_project/core/resources/app_color.dart';
import 'package:front_project/core/resources/app_style.dart';


class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(alignment: Alignment.center,
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: AppColor.primary,
        ),
        child: Text(label, style: AppStyle.whiteColor16Bold),
      ),
    );
  }
}
