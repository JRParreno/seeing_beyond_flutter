import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:seeing_beyond/gen/colors.gen.dart';
import 'package:seeing_beyond/src/about_us/about_us_page.dart';
import 'package:seeing_beyond/src/color_scanner/presentation/color_scanner_page.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/color_vision_test_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  List<Widget> pages = const [
    ColorVisionTestPage(),
    ColorScannerPage(),
    AboutUsPage(),
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: FluidNavBar(
        style: FluidNavBarStyle(
          barBackgroundColor: getBackgroundColor(index),
          iconUnselectedForegroundColor: ColorName.placeHolder,
          iconSelectedForegroundColor: Colors.white,
        ),
        icons: [
          FluidNavBarIcon(
              icon: const Icon(
            Icons.edit_document,
          ).icon), // (3)
          FluidNavBarIcon(
              icon: const Icon(
            Icons.document_scanner,
          ).icon), // (3)
          FluidNavBarIcon(
              icon: const Icon(
            Icons.info,
          ).icon), // (3)
        ],
        onChange: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }

  Color getBackgroundColor(int currentIndex) {
    if (index == 0) {
      return ColorName.primary;
    }
    if (index == 1) {
      return Colors.orange;
    }
    return Colors.red;
  }
}
