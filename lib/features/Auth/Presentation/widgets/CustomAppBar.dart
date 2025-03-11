import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles/textStyles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final void Function() onPress;
  final IconButton? icon;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.onPress,
    this.icon 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment :MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: onPress,
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        const SizedBox(
          width: 85,
        ),
        Center(
          child: Text(title, style: TextStyles.bold19),
        ),
        const Spacer(),
        icon ?? const SizedBox(),
      ],
    );
  }
}
