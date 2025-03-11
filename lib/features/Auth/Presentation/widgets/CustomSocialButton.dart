import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles/app_colors.dart';
import '../../../../../Core/utils/styles/textStyles.dart';

class CustomSocialButton extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onPressed;

  const CustomSocialButton({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        fixedSize: const Size(double.infinity, 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
              width: 1, color: AppColors.customTextFieldBorder),
        ),
      ),
      child: Row(
        mainAxisAlignment: Localizations.localeOf(context).languageCode == 'ar'
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          Image.asset(imageUrl, width: 20, height: 20),
          const Spacer(),
          Text(
            title,
            style: TextStyles.semiBold16.copyWith(color: Colors.black),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}