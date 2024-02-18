import 'package:flutter/material.dart';
import 'package:seeing_beyond/core/common_widget/common_widget.dart';
import 'package:seeing_beyond/core/local_storage/local_storage.dart';
import 'package:seeing_beyond/gen/colors.gen.dart';
import 'package:seeing_beyond/src/home/home_page.dart';

class BottomOnboarding extends StatelessWidget {
  const BottomOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: CustomBtn(
        label: 'Get Started',
        onTap: () {
          LocalStorage.storeLocalStorage('on_boarding', 'false');
          Navigator.of(context).pushNamed(HomePage.routeName);
        },
        backgroundColor: Colors.white,
        style: const TextStyle(
          color: ColorName.primary,
        ),
      ),
    );
  }
}
