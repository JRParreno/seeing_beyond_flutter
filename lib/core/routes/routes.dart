import 'package:flutter/material.dart';
import 'package:seeing_beyond/src/about_us/about_us_page.dart';
import 'package:seeing_beyond/src/color_scanner/presentation/color_scanner_page.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/color_vision_test_page.dart';
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
