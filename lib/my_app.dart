import 'package:flutter/material.dart';
import 'package:front_project/core/resources/app_color.dart';
import 'package:front_project/core/resources/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.whiteColor,
        appBarTheme: AppBarTheme(backgroundColor: AppColor.greyFAColor),
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
