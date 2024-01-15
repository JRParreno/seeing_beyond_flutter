import 'package:flutter/material.dart';

class MicrophoneCardPermission extends StatelessWidget {
  const MicrophoneCardPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.only(
          top: 20,
        ),
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '🎤 Tap this to enable microphone.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
