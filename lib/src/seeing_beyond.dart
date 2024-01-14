import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seeing_beyond/core/local_storage/local_storage.dart';
import 'package:seeing_beyond/core/resources/theme/theme.dart';
import 'package:seeing_beyond/core/routes/routes.dart';
import 'package:seeing_beyond/src/on_boarding/on_boarding_page.dart';

class SeeingBeyond extends StatefulWidget {
  const SeeingBeyond({super.key});
  static final navKey = GlobalKey<NavigatorState>();

  @override
  State<SeeingBeyond> createState() => _SeeingBeyondState();
}

class _SeeingBeyondState extends State<SeeingBeyond> {
  bool isNeedOnBoarded = false;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    final onBoarding = await LocalStorage.readLocalStorage('on_boarding');

    if (onBoarding != null) {
      setState(() {
        isNeedOnBoarded = onBoarding;
      });
    }
    Future.delayed(const Duration(seconds: 2), () {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: ((context, child) {
        return MaterialApp(
          navigatorKey: SeeingBeyond.navKey,
          themeMode: ThemeMode.light,
          darkTheme: MaterialAppThemes.lightTheme,
          theme: MaterialAppThemes.lightTheme,
          onGenerateRoute: generateRoute,
          home:
              isNeedOnBoarded ? const OnBoardingPage() : const OnBoardingPage(),
        );
      }),
    );
  }
}
