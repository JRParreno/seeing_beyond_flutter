import 'package:flutter/material.dart';
import 'package:seeing_beyond/core/common_widget/custom_appbar.dart';

class AboutUsPage extends StatefulWidget {
  static const String routeName = '/about-us-page';

  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        backgroundColor: Colors.red,
        context: context,
        title: 'About us',
        showBackBtn: true,
      ),
      body: Container(),
    );
  }
}
