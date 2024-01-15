import 'package:flutter/material.dart';
import 'package:seeing_beyond/core/common_widget/custom_appbar.dart';

class ColorScannerPage extends StatefulWidget {
  static const String routeName = '/color-scanner-page';

  const ColorScannerPage({super.key});

  @override
  State<ColorScannerPage> createState() => _ColorScannerPageState();
}

class _ColorScannerPageState extends State<ColorScannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Color Scanner',
        showBackBtn: true,
        backgroundColor: Colors.orange,
      ),
      body: Container(),
    );
  }
}
