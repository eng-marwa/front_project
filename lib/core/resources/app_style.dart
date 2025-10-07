import 'package:flutter/material.dart';

import 'app_color.dart';

class AppStyle {
  AppStyle._();

  static const TextStyle purple14Medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.primary,
  );
  static const TextStyle black12Color14Medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.black12Color,
  );
  static const TextStyle black12Color20Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColor.black12Color,
    fontFamily: 'OpenSans',
  );

  static const TextStyle black12Color24Bold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColor.black12Color,
    fontFamily: 'OpenSans',
  );
  static const TextStyle whiteColor16Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColor.whiteColor,
    fontFamily: 'OpenSans',
  );

  static const TextStyle primaryColor16Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColor.primary,
    fontFamily: 'OpenSans',
  );
  static const TextStyle greyA6Color16Regular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColor.greyA6Color,
  );
}
