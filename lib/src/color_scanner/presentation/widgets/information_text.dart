import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ColorScannerInformationText extends StatelessWidget {
  const ColorScannerInformationText({super.key});

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
          color: Colors.orange,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Click on 'Take a Picture' to activate your device's camera. Capture an image of an object or scene containing colors you want to explore. The app will analyze the real-time image, categorizing the colors into predefined categories (ROYGBIV).",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(10),
                Text(
                  "Select 'Upload Image' to choose a photo from your phone's pictures. Pick a photo with colors you're curious about. The app will check the colors in that photo and show you what they are.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(10),
                Text(
                  "Tap the 'Scan Color' button to proceed.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
