import 'package:flutter/material.dart';
import 'package:front_project/core/di/module.dart';
import 'package:front_project/features/auth/data/datasource/local/prefs_helper.dart';
import 'package:front_project/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  PrefsHelper.instance.init();
  runApp(const MyApp());
}
