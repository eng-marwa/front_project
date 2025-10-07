import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_project/core/di/module.dart';
import 'package:front_project/features/auth/presentation/login_screen.dart';
import 'package:front_project/features/home/presentation/home_screen.dart';
import 'package:front_project/features/onboarding/presentation/onboarding_screen.dart';
import 'package:front_project/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:front_project/features/splash/presentation/splash_screen.dart';

class Routes {
  static const String home = '/home';
  static const String login = '/login';
  static const String onboarding = '/onboarding';
  static const String splash = '/';
}

class AppRouter {
  AppRouter._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SplashCubit>(
            create: (context) => getIt<SplashCubit>(),
            child: SplashScreen(),
          ),
        );
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) =>
          Scaffold(body: Center(child: Text('No route found'))),
    );
  }
}
