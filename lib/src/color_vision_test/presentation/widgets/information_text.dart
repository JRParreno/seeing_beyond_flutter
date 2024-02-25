import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seeing_beyond/gen/colors.gen.dart';

class InformationText extends StatelessWidget {
  const InformationText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How it works:',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
        Gap(10),
        Card(
          color: ColorName.primary,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Random various colors will flash on the screen. Identify each one to proceed to the next.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(20),
                Text(
                  "Please use the microphone to respond. Tap the 'Continue' button to start the test.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Gap(20),
        Text(
          'DISCLAIMER',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
        Gap(10),
        Card(
          color: ColorName.primary,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please note that the color vision test provided in this application requires fluent English for accurate interpretation and completion. Users are encouraged to ensure language proficiency to effectively engage with the test materials.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
