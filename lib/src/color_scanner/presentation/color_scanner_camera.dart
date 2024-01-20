import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seeing_beyond/core/common_widget/common_widget.dart';
import 'package:seeing_beyond/core/common_widget/custom_appbar.dart';

import 'package:seeing_beyond/src/color_scanner/presentation/color_scanner_result.dart';

class ColorScannerCameraArgs {
  final CameraDescription camera;

  ColorScannerCameraArgs({
    required this.camera,
  });
}

class ColorScannerCamera extends StatefulWidget {
  static const String routeName = '/color-scanner-camera';
  final ColorScannerCameraArgs args;

  const ColorScannerCamera({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<ColorScannerCamera> createState() => _ColorScannerCameraState();
}

class _ColorScannerCameraState extends State<ColorScannerCamera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      widget.args.camera,
      ResolutionPreset.max,
    );

    _initializeControllerFuture = _controller.initialize();
    _controller.setFlashMode(FlashMode.off);
    _controller.setExposureMode(ExposureMode.locked);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Scan Color',
        context: context,
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Card(
                    margin: EdgeInsets.zero,
                    color: Colors.amber,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.info),
                          Text(
                            'Please center at the box',
                            style: TextStyle(
                                // color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: ClipRRect(
                            child: SizedOverflowBox(
                              size: const Size(300, 300), // aspect is 1:1
                              alignment: Alignment.center,
                              child: CameraPreview(_controller),
                            ),
                          ),
                        ),
                        const Gap(50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 37.0),
                          child: CustomBtn(
                            label: 'Capture',
                            onTap: () {
                              takePhoto();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> takePhoto() async {
    // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;

      // Attempt to take a picture and get the file `image`
      // where it was saved.
      final image = await _controller.takePicture();

      if (!mounted) return;

      // If the picture was taken, display it on a new screen.
      await Navigator.of(context).pushNamed(
        ColorScannerResult.routeName,
        arguments: Image.file(
          File(image.path),
        ).image,
      );
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }
}
