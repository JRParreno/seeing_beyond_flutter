import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:seeing_beyond/core/common_widget/common_widget.dart';
import 'package:seeing_beyond/core/common_widget/custom_appbar.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/bloc/color_vision_bloc.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/color_vision_test_result.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/widgets/body_exam_color_test.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/widgets/bottom_nav_color_test.dart';
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

  @override
  void initState() {
    super.initState();
    _speechToText.initialize();
    initBloc();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        exitDialog();
        return false;
      },
      child: Scaffold(
        appBar: buildAppBar(
            context: context,
            title: 'Color Vision Test',
            leading: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () {
                exitDialog();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.help,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  helpDialog();
                },
              ),
            ]),
        body: BlocConsumer<ColorVisionBloc, ColorVisionState>(
          listener: (context, state) {
            if (state is ColorVisionStart) {
              if (state.isDoneExam) {
                BlocProvider.of<ColorVisionBloc>(context)
                    .add(OnGetResultTest());

                Navigator.of(context)
                    .pushReplacementNamed(ColorVisionTestResult.routeName);
              }
            }
          },
          builder: (context, state) {
            if (state is ColorVisitionError) {
              return const Center(
                child: Text('Something went wrong.'),
              );
            }
            if (state is ColorVisionStart) {
              return BodyExamColorTest(
                state: state,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        bottomNavigationBar: BottomNavColorTest(
          speechToText: _speechToText,
          startListening: _startListening,
          stopListening: _stopListening,
        ),
      ),
    );
  }

  void initBloc() {
    BlocProvider.of<ColorVisionBloc>(context)
        .add(OnInitShuffleColorVisionTest());
  }

  void startColorTest() {
    BlocProvider.of<ColorVisionBloc>(context).add(OnStartColorVisionTest());
  }

  void exitDialog() {
    CommonDialog.showMyDialog(
      context: context,
      body: 'Do you want to exit the test?',
      buttons: [
        TextButton(
          child: const Text(
            'Yes',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("No"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  void helpDialog() {
    CommonDialog.showMyDialog(
      context: context,
      body:
          "Random various colors will flash on the screen. Identify each one to proceed to the next.\n\nPlease use the microphone to respond. Tap the 'Continue' button to start the test.",
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
    final colorNameWords = [
      'red',
      'yellow',
      'orange',
      'blue',
      'indigo',
      'violet',
      'green'
    ];

    final recognizedWords = result.recognizedWords;
    String colorName = '';

    for (String colorNameWord in colorNameWords) {
      final check = recognizedWords.toLowerCase().contains(colorNameWord);

      if (check) {
        colorName = colorNameWord;
        break;
      }
    }
    if (colorName.isNotEmpty) {
      BlocProvider.of<ColorVisionBloc>(context)
          .add(OnGetSpeechToText(result.recognizedWords));
    } else {
      Fluttertoast.showToast(
          msg: "Please try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      _stopListening();
    }
  }
}
