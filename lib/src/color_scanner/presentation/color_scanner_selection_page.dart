import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seeing_beyond/core/common_widget/common_widget.dart';
import 'package:seeing_beyond/core/common_widget/custom_appbar.dart';
import 'package:seeing_beyond/core/permission/permission.dart';
import 'package:seeing_beyond/src/color_scanner/presentation/color_scanner_camera.dart';
import 'package:seeing_beyond/src/color_scanner/presentation/color_scanner_result.dart';
import 'package:seeing_beyond/src/color_scanner/presentation/widgets/camera_card_permission.dart';
import 'package:seeing_beyond/src/color_scanner/presentation/widgets/color_selection_card.dart';

class ColorScannerSelectionPage extends StatefulWidget {
  static const String routeName = '/color-scanner-selection-page';

  const ColorScannerSelectionPage({super.key});

  @override
  State<ColorScannerSelectionPage> createState() =>
      _ColorScannerSelectionPageState();
}

class _ColorScannerSelectionPageState extends State<ColorScannerSelectionPage> {
  bool isCamPermission = false;

  @override
  void initState() {
    super.initState();

    checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Color Scanner',
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 30,
          right: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      '  Please select',
                      style: TextStyle(
                          // color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            if (!isCamPermission) ...[
              const Gap(10),
              CameraCardPermission(
                tapEnablePermission: () {
                  checkPermission();
                },
              ),
            ],
            const Gap(30),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorSelectionCard(
                  backgroundColor: Colors.orangeAccent.shade400,
                  iconData: Icons.camera,
                  titleCard: 'TAKE A PICTURE',
                  onTap: () {
                    navigateCamera();
                  },
                ),
                const Gap(30),
                ColorSelectionCard(
                  backgroundColor: Colors.blueAccent.shade100,
                  iconData: Icons.photo_library,
                  titleCard: 'UPLOAD IMAGE',
                  onTap: () {
                    pickFromGallery();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (!mounted) return;

    if (pickImage != null) {
      Navigator.of(context).pushNamed(
        ColorScannerResult.routeName,
        arguments: Image.file(
          File(pickImage.path),
        ).image,
      );
    }
  }

  Future<void> navigateCamera() async {
    final camPermission = await cameraPermission();

    if (camPermission) {
      final cameras = await availableCameras();
      if (!mounted) return;

      if (cameras.isNotEmpty) {
        Navigator.of(context).pushNamed(
          ColorScannerCamera.routeName,
          arguments: ColorScannerCameraArgs(camera: cameras.first),
        );
        return;
      }
    }

    if (!mounted) return;
    return CommonDialog.showMyDialog(
      context: context,
      body: 'Please enable camera permission',
    );
  }

  void checkPermission() async {
    final status = await cameraPermission();

    setState(() {
      isCamPermission = status;
    });
  }
}
