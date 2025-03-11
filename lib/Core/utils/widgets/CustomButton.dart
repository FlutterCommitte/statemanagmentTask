import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/textStyles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.onPressed, required this.buttonName});
  final VoidCallback onPressed;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.lightPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: onPressed,
          child: Text(buttonName,
              textAlign: TextAlign.center,
              style: TextStyles.bold16.copyWith(color: Colors.white))),
    );
  }
}
