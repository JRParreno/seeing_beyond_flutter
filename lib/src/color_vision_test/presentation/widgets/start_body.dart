import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:seeing_beyond/core/common_widget/common_widget.dart';

class StartBody extends StatelessWidget {
  const StartBody({
    Key? key,
    required this.onStart,
  }) : super(key: key);

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '▶️ Press start to begin',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
        const Gap(10),
        CustomBtn(
          label: 'Start',
          onTap: () {
            onStart();
          },
        ),
      ],
    );
  }
}
