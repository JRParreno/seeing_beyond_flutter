import 'package:flutter/material.dart';
import 'package:seeing_beyond/core/common_widget/custom_appbar.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ColorVisionActualTestPage extends StatefulWidget {
  static const String routeName = 'color-vision-actual';

  const ColorVisionActualTestPage({super.key});

  @override
  State<ColorVisionActualTestPage> createState() =>
      _ColorVisionActualTestPageState();
}

class _ColorVisionActualTestPageState extends State<ColorVisionActualTestPage> {
  final SpeechToText _speechToText = SpeechToText();
  String _lastWords = "";

  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _speechToText.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Color Vision Test',
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(12),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    minLines: 6,
                    maxLines: 10,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                FloatingActionButton.small(
                  onPressed:
                      // If not yet listening for speech start, otherwise stop
                      _speechToText.isNotListening
                          ? _startListening
                          : _stopListening,
                  tooltip: 'Listen',
                  backgroundColor: Colors.blueGrey,
                  child: Icon(
                      _speechToText.isNotListening ? Icons.mic_off : Icons.mic),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(
      onResult: _onSpeechResult,
      listenFor: const Duration(seconds: 30),
      localeId: "en_En",
      cancelOnError: false,
      partialResults: false,
      listenMode: ListenMode.confirmation,
    );
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      _textController.text = _lastWords;
    });
  }
}
