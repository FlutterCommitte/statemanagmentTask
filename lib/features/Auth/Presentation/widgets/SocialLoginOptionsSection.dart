import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/utils/constants/assetsImages.dart';
import '../../cubits/signInCubit/cubit/sign_in_cubit.dart';
import 'CustomSocialButton.dart';
import 'SeparatorRow.dart';
import 'SignUpTextRow.dart';

class SocialLoginOptionsSection extends StatelessWidget {
  const SocialLoginOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SignUpTextRow(),
        const SizedBox(height: 33),
        const SeparatorRow(),
        const SizedBox(height: 13),
        CustomSocialButton(
            title: "تسجيل الدخول بحساب جوجل",
            onPressed: () {
              context.read<SignInCubit>().signInWithGoogle();
            },
            imageUrl: Assets.assetsImagesGoogle),
        const SizedBox(height: 13),
        CustomSocialButton(
            title: "تسجيل بواسطة أبل",
            onPressed: () {
                 context.read<SignInCubit>().signInWithApple();
            },
            imageUrl: Assets.assetsImagesAppleIcon),
        const SizedBox(height: 13),
        CustomSocialButton(
            title: "تسجيل بواسطة فيسبوك",
            onPressed: () {
                 context.read<SignInCubit>().signInWithFaceBook();
            },
            imageUrl: Assets.assetsImagesFaceBookIcon),
      ],
    );
  }
}
