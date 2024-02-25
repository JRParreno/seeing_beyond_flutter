import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seeing_beyond/gen/colors.gen.dart';

import 'package:seeing_beyond/src/color_vision_test/data/models/color_result_model.dart';

class ConclusionResults extends StatelessWidget {
  const ConclusionResults({
    Key? key,
    required this.colorResultModel,
  }) : super(key: key);

  final List<ColorResultModel> colorResultModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Congratulations on completing the Color Vision Test!',
            style: TextStyle(
              color: ColorName.placeHolder,
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(10),
          getConclusionText(),
          if (colorResultModel.isNotEmpty) ...[
            const Gap(10),
            const Text(
              'We recommend consulting with an ophthalmologist for a professional evaluation and precise diagnostics. They provide valueable insights and guidance regarding your color perception.',
              style: TextStyle(
                color: ColorName.placeHolder,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
          const Gap(10),
          const Divider(
            color: ColorName.placeHolder,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.info,
                color: Colors.red,
              ),
              Text(
                ' Disclaimer!',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Text(
            'This test is for Educational purposes and not a substitute for professional medical advice. Thank you for using "Seeing Beyond" 👀. Consult an opthalmologist for further evaluation.',
            style: TextStyle(
              color: ColorName.placeHolder,
            ),
            textAlign: TextAlign.justify,
          ),
          const Gap(30),
        ],
      ),
    );
  }

  Widget getConclusionText() {
    const impressiveText = 'Your overall performance is impressive';

    if (colorResultModel.isEmpty) {
      return const Text(
        '$impressiveText .',
        style: TextStyle(
          color: ColorName.placeHolder,
        ),
        textAlign: TextAlign.justify,
      );
    }

    final diffColors = colorResultModel.map((e) {
      if (e.isDifficulty) {
        return e.colorName;
      }
    }).toList();

    String colorWords = '';

    for (int i = 0; i < diffColors.length; i++) {
      final element = diffColors[i];
      if (i == (diffColors.length - 2)) {
        colorWords += '$element and ${diffColors.last}';
        break;
      }
      colorWords += '$element, ';
    }

    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: const TextStyle(
          color: ColorName.placeHolder,
          fontSize: 16,
          height: 1.5,
        ),
        children: [
          const TextSpan(
            text: impressiveText,
          ),
          const TextSpan(
            text: ", While you did well, there's difficulty with ",
          ),
          TextSpan(
            text: colorWords,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text:
                '. There is a chance that you may have color vision deficiency.',
          ),
        ],
      ),
    );
  }
}
