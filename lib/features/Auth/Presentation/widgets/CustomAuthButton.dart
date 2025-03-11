import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles/app_colors.dart';
import '../../../../../Core/utils/styles/textStyles.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkPrimaryColor,
            fixedSize: const Size(double.infinity, 54),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        onPressed: onPressed,
        child: Center(
          child: Text(title,
              style: TextStyles.bold16.copyWith(color: Colors.white)),
        ));
  }
}
