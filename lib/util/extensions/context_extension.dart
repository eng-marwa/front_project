import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void navigateTo(String routeName) {
    Navigator.pushNamed(this, routeName);
  }

  void navigateReplacement(String routeName) {
    Navigator.pushReplacementNamed(this, routeName);
  }
}
