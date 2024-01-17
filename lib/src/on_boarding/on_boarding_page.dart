import 'package:flutter/material.dart';
import 'package:seeing_beyond/gen/assets.gen.dart';
import 'package:seeing_beyond/src/on_boarding/widgets/body_onboarding.dart';

class OnBoardingPage extends StatefulWidget {
  static const String routeName = '/on_boarding';

  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Assets.lottie.onBoardingAnimation.lottie(),
            ),
            const Expanded(
              child: BodyOnboarding(),
            ),
          ],
        ),
      ),
    );
  }
}
