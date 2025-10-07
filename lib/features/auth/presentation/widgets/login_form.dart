import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_project/core/common_widgets/app_text_field.dart';
import 'package:front_project/core/resources/app_buttons_style.dart';
import 'package:front_project/core/resources/app_style.dart';
import 'package:front_project/features/auth/presentation/cubit/login_cubit.dart';
import 'package:front_project/features/auth/presentation/cubit/login_state.dart';
import 'package:front_project/features/home/presentation/home_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            label: 'Username',
            hint: 'Your Username',
            controller: usernameController,
          ),
          const SizedBox(height: 16),
          AppTextField(
            label: 'Password',
            hint: 'Your Password',
            controller: passwordController,
            isPassword: true,
          ),
          const SizedBox(height: 60),
          BlocConsumer<LoginCubit, LoginState>(
            listenWhen: (previous, current) =>
                current is LoginSuccess || current is LoginError,
            listener: (context, state) {
              if (state is LoginSuccess) {
                // context.read<LoginCubit>().setLoggedIn(true);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              } else if (state is LoginError) {
                final snackBar = SnackBar(
                  content: Text(
                    state.message,
                    style: AppStyle.whiteColor16Bold,
                  ),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                // do nothing
              }
            },
            buildWhen: (previous, current) =>
                current is Loading || current is Initial,
            builder: (context, state) {
              if (state is Loading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ElevatedButton(
                  onPressed: () {
                    context.read<LoginCubit>().login(
                      usernameController.text,
                      passwordController.text,
                    );
                  },
                  style: AppButtonsStyle.primaryButtonStyle,
                  child: Text('Login', style: AppStyle.whiteColor16Bold),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
