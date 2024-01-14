import 'package:flutter/material.dart';
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
