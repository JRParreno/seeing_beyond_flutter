import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seeing_beyond/core/common_widget/common_widget.dart';
import 'package:seeing_beyond/core/common_widget/custom_appbar.dart';
import 'package:seeing_beyond/gen/assets.gen.dart';

import 'package:seeing_beyond/src/color_scanner/presentation/color_scanner_selection_page.dart';
import 'package:seeing_beyond/src/color_scanner/presentation/widgets/information_text.dart';
import 'package:video_player/video_player.dart';

class ColorScannerPage extends StatefulWidget {
  static const String routeName = '/color-scanner-page';

  const ColorScannerPage({super.key});

  @override
  State<ColorScannerPage> createState() => _ColorScannerPageState();
}

class _ColorScannerPageState extends State<ColorScannerPage> {
  late VideoPlayerController _controller;
  late ChewieController chewieController;
  late Chewie playerWidget;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(Assets.videos.colorScanner);

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
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: buildAppBar(
          context: context,
          title: 'Color Scanner',
          showBackBtn: true,
          backgroundColor: Colors.orange,
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
                const ColorScannerInformationText(),
                const Gap(20),
                CustomBtn(
                  label: 'Scan Color',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ColorScannerSelectionPage.routeName,
                    );
                  },
                  backgroundColor: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
