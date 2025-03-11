import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles/app_colors.dart';
import '../../../../../Core/utils/styles/textStyles.dart';

class SignUpTextRow extends StatelessWidget {
  const SignUpTextRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(

    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "يس لديك حساب؟",
          style: TextStyles.semiBold16,
        ),
        InkWell(
          onTap: () {
          //  GoRouter.of(context).push(AppRoutes.signUpView);
          },
          child:  Text(
            "سجل الان",
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.lightPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

