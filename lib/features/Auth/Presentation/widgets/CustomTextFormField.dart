import 'package:flutter/material.dart';

import 'CustomTextFormFiledItem.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.isPasswordObscure,
    required this.emailController,
    required this.passwordController,
    required this.onPressed,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onPressed;
  final bool isPasswordObscure;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFiledItem(
           
            onPressed: onPressed,
            isObscure: isPasswordObscure,
            controller: emailController,
            isPassword: false,
            title: "البريد الالكتروني"),
        const SizedBox(
          height: 16,
        ),
        CustomTextFormFiledItem(
            onPressed: onPressed,
            isObscure: isPasswordObscure,
            controller: passwordController,
            isPassword: true,
            title: "كلمة المرور"),

      ],
    );
  }
}
