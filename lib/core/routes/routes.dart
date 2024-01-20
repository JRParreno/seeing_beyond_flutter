import 'package:flutter/material.dart';
import 'package:seeing_beyond/src/about_us/about_us_page.dart';
import 'package:seeing_beyond/src/color_scanner/presentation/color_scanner_camera.dart';
import 'package:seeing_beyond/src/color_scanner/presentation/color_scanner_page.dart';
import 'package:seeing_beyond/src/color_scanner/presentation/color_scanner_result.dart';
import 'package:seeing_beyond/src/color_scanner/presentation/color_scanner_selection_page.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/color_vision_actual_test_page.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/color_vision_test_page.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/color_vision_test_result.dart';
import 'package:seeing_beyond/src/home/home_page.dart';
import 'package:seeing_beyond/src/on_boarding/on_boarding_page.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) {
      switch (settings.name) {
        case OnBoardingPage.routeName:
          return const OnBoardingPage();
        case HomePage.routeName:
          return const HomePage();
        case ColorVisionTestPage.routeName:
          return const ColorVisionTestPage();
        case ColorScannerPage.routeName:
          return const ColorScannerPage();
        case AboutUsPage.routeName:
          return const AboutUsPage();
        case ColorVisionActualTestPage.routeName:
          return const ColorVisionActualTestPage();
        case ColorVisionTestResult.routeName:
          return const ColorVisionTestResult();
        case ColorScannerCamera.routeName:
          final args = settings.arguments! as ColorScannerCameraArgs;
          return ColorScannerCamera(
            args: args,
          );
        case ColorScannerResult.routeName:
          final args = settings.arguments! as ImageProvider;
          return ColorScannerResult(
            imageProvider: args,
          );
        case ColorScannerSelectionPage.routeName:
          return const ColorScannerSelectionPage();
      }

      return const Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Text('Something went wrong'),
        ),
      );
    },
  );
}
