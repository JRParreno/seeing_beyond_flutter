import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:seeing_beyond/core/common_widget/custom_appbar.dart';
import 'package:seeing_beyond/gen/assets.gen.dart';
import 'package:seeing_beyond/gen/colors.gen.dart';
import 'package:seeing_beyond/src/about_us/widgets/card_description_text.dart';
import 'package:seeing_beyond/src/about_us/widgets/developer_card.dart';

class AboutUsPage extends StatefulWidget {
  static const String routeName = '/about-us-page';

  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  String versionInfo = 'Getting....';

  @override
  void initState() {
    super.initState();
    initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        backgroundColor: Colors.red,
        context: context,
        title: 'About us',
        showBackBtn: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardDescriptionText(
                content:
                    "Welcome to 'Seeing Beyond'! We're here to help you discover more about how you see colors. Our app makes it fun and easy to explore your unique vision. With interactive tests and real-world color scanning, you can learn about your color perception in a simple and enjoyable way. Whether you love colors or are just curious, 'Seeing Beyond' is here for you. Let's have some colorful fun together!",
                title: 'Our App',
              ),
              const Gap(10),
              const Divider(
                color: ColorName.border,
              ),
              const Gap(10),
              const CardDescriptionText(
                content: '',
                title: 'Developers',
              ),
              DeveloperCard(
                image: Assets.images.delosSantos.image(),
                name: 'Lio Jim D. Delos Santos',
                courseName: 'BS Computer Science',
              ),
              const Gap(10),
              DeveloperCard(
                image: Assets.images.bo.image(),
                name: 'John Mhar E. Bo',
                courseName: 'BS Computer Science',
              ),
              const Gap(10),
              DeveloperCard(
                image: Assets.images.almonte.image(),
                name: 'John Rey C. Almonte',
                courseName: 'BS Computer Science',
              ),
              const Gap(10),
              const Divider(
                color: ColorName.border,
              ),
              const Gap(10),
              Text(
                'Version: $versionInfo',
                style: const TextStyle(
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> initPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      versionInfo = packageInfo.buildNumber.split('').join('.');
    });
  }
}
