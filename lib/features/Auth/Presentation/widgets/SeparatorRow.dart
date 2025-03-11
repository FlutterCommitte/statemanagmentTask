
import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles/textStyles.dart';

class SeparatorRow extends StatelessWidget {
  const SeparatorRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(thickness: 1, color: Color(0xFFDDDFDF))),
        Text('   أو   ' , style: TextStyles.semiBold16,),
        Expanded(child: Divider(thickness: 1, color: Color(0xFFDDDFDF))),
       
      ],
    );
  }
}

