import 'package:flutter/material.dart';
import 'package:front_project/core/resources/app_color.dart';

class AppButtonsStyle {
  AppButtonsStyle._();

  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    backgroundColor: AppColor.primary,
    minimumSize: Size(double.infinity, 56),
    fixedSize: Size(double.infinity, 56),
    foregroundColor: AppColor.whiteColor,
  );
  static ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    backgroundColor: AppColor.lightPurpleFAColor,elevation: 1,
    minimumSize: Size(double.infinity, 56),
    fixedSize: Size(double.infinity, 56),
    foregroundColor: AppColor.primary,
  );
}
