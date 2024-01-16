import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'package:seeing_beyond/src/color_vision_test/presentation/bloc/color_vision_bloc.dart';

class BottomNavColorTest extends StatelessWidget {
  const BottomNavColorTest({
    Key? key,
    required this.speechToText,
    required this.startListening,
    required this.stopListening,
  }) : super(key: key);

  final SpeechToText speechToText;
  final VoidCallback startListening;
  final VoidCallback stopListening;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorVisionBloc, ColorVisionState>(
      builder: (context, state) {
        if (state is ColorVisionStart) {
          if (state.isStartExam) {
            return Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              child: FloatingActionButton.small(
                onPressed:
                    // If not yet listening for speech start, otherwise stop
                    speechToText.isNotListening
                        ? startListening
                        : stopListening,
                tooltip: 'Listen',
                backgroundColor: Colors.blueGrey,
                child: Icon(
                    speechToText.isNotListening ? Icons.mic_off : Icons.mic),
              ),
            );
          }
        }
        return const SizedBox();
      },
    );
  }
}
