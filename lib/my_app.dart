import 'package:flutter/material.dart';
import 'package:front_project/presentation/features/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
