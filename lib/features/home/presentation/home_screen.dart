import 'package:flutter/material.dart';
import 'package:front_project/features/home/presentation/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:HomeAppBar() ,);
  }
}
