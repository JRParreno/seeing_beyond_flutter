import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:seeing_beyond/core/common_widget/common_widget.dart';
import 'package:seeing_beyond/core/common_widget/custom_appbar.dart';
import 'package:seeing_beyond/gen/assets.gen.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/color_vision_actual_test_page.dart';
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
  bool isMicPermission = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(Assets.videos.colorVisionTest);

    chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: false,
      looping: false,
      allowMuting: true,
    );

    playerWidget = Chewie(
      controller: chewieController,
    );

    checkPermission();
  }

  @override
  void dispose() {
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
              const Text(
                'Tutorial Video',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 200,
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  child: playerWidget,
                ),
              ),
              const Gap(10),
              const InformationText(),
              if (!isMicPermission) ...[
                MicrophoneCardPermission(
                  tapEnablePermission: () {
                    checkPermission();
                  },
                ),
              ],
              const Gap(20),
              CustomBtn(
                label: 'Continue to Test',
                onTap: isMicPermission
                    ? () {
                        Navigator.of(context).pushNamed(
                          ColorVisionActualTestPage.routeName,
                        );
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkPermission() async {
    final status = await Permission.microphone.status;
    if (status == PermissionStatus.denied) {
      await Permission.microphone.request();
      checkPermission();
    }
    setState(() {
      isMicPermission = status == PermissionStatus.granted;
    });
  }
}
