import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seeing_beyond/core/common_widget/common_widget.dart';
import 'package:seeing_beyond/core/common_widget/custom_appbar.dart';
import 'package:seeing_beyond/gen/assets.gen.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/widgets/information_text.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/widgets/microphone_card_permission.dart';
import 'package:video_player/video_player.dart';

class ColorVisionTestPage extends StatefulWidget {
  static const String routeName = '/color-vision-test-page';

  const ColorVisionTestPage({super.key});

  @override
  State<ColorVisionTestPage> createState() => _ColorVisionTestPageState();
}

class _ColorVisionTestPageState extends State<ColorVisionTestPage> {
  late VideoPlayerController _controller;
  late ChewieController chewieController;
  late Chewie playerWidget;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.asset(Assets.videos.tutorial);

    chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: false,
      looping: false,
      allowMuting: true,
    );

    playerWidget = Chewie(
      controller: chewieController,
    );
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Color Vision Test',
        showBackBtn: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: playerWidget,
                  ),
                ),
              ),
              const Gap(10),
              const InformationText(),
              const MicrophoneCardPermission(),
              const Gap(20),
              CustomBtn(
                label: 'Continue to Test',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
