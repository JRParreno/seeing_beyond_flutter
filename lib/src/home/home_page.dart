import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:seeing_beyond/core/common_widget/custom_appbar.dart';
import 'package:seeing_beyond/core/widgets/app_bar/custom_app_bar.dart';
import 'package:seeing_beyond/gen/colors.gen.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: buildAppBar(
          context: context, title: 'Color Vision Test', showBackBtn: true),
      body: Container(),
      bottomNavigationBar: FluidNavBar(
        style: const FluidNavBarStyle(
          barBackgroundColor: ColorName.primary,
          iconBackgroundColor: Colors.white,
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
        onChange: (value) {}, // (4)
      ),
    );
  }
}
