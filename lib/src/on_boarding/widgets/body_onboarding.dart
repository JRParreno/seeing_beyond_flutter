import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seeing_beyond/gen/colors.gen.dart';
import 'package:seeing_beyond/src/on_boarding/widgets/bottom_onboarding.dart';

class BodyOnboarding extends StatelessWidget {
  const BodyOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
        color: ColorName.primary, //Border.all
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'WELCOME',
            style: TextStyle(
                color: Colors.white, fontSize: 45, fontWeight: FontWeight.w700),
          ),
          Gap(10),
          Text(
            'Seeing Beyond',
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.w600),
          ),
          Text(
            'A Color-Vision Deficiency Recognition',
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          Gap(20),
          BottomOnboarding(),
        ],
      ),
    );
  }
}
