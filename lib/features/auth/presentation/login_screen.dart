import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_project/core/di/module.dart';
import 'package:front_project/core/resources/app_router.dart';
import 'package:front_project/features/auth/presentation/cubit/login_cubit.dart';
import 'package:front_project/features/auth/presentation/widgets/app_rich_text.dart';
import 'package:front_project/features/auth/presentation/widgets/auth_header.dart';
import 'package:front_project/features/auth/presentation/widgets/login_form.dart';
import 'package:front_project/util/extensions/context_extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthHeader(label: 'Sign In', description: 'Sign to your account'),
              const SizedBox(height: 60),
              LoginForm(),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.center,
                child: AppRichText(
                  originalText: "Don't have an account? ",
                  linkText: 'Sign Up',
                  onTap: () => context.navigateTo(Routes.home),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
