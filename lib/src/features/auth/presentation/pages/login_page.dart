import 'package:count_down/src/core/theme/app_color.dart';
import 'package:count_down/src/features/auth/presentation/widget/auth_field.dart';
import 'package:count_down/src/features/auth/presentation/widget/auth_grad_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthField(
                  hintText: "Email",
                  controller: emailController,
                  isObsecureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthField(
                  hintText: "Password",
                  controller: passwordController,
                  isObsecureText: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                AuthGradientButton(buttonText: "Login", onPressed: () {}),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () async {},
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColor.gradient2,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
