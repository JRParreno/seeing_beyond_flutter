import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:seeing_beyond/gen/colors.gen.dart';

class CardDescriptionText extends StatelessWidget {
  const CardDescriptionText({
    Key? key,
    required this.content,
    this.title,
  }) : super(key: key);

  final String? title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    if (content.isEmpty && title == null) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title ?? '',
            style: themeContext.textTheme.displayMedium,
          ),
          const Gap(10),
        ],
        if (content.isNotEmpty) ...[
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorName.border,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              content,
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ],
    );
  }
}
