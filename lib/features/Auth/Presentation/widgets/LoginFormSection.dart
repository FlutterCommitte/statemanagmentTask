import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/signInCubit/cubit/sign_in_cubit.dart';
import 'CustomAppBar.dart';
import 'CustomAuthButton.dart';
import 'CustomTextFormField.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordObscure = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void updateState() {
    setState(() {
      isPasswordObscure = !isPasswordObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: "تسجيل الدخول", onPress: () {}),
        const SizedBox(height: 24),
        CustomTextFormField(
          isPasswordObscure: isPasswordObscure,
          emailController: emailController,
          passwordController: passwordController,
          onPressed: updateState,
        ),
        const SizedBox(height: 33),
        CustomAuthButton(title: "تسجيل الدخول", onPressed: ()async {
          await context.read<SignInCubit>().signInUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
        }),
        const SizedBox(height: 10),
        
      ],
    );
  }
}
