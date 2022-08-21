import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quran/core/core.dart';
import 'package:quran/routes/app_navigator.dart';
import 'package:quran/routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final QuranUz _quranUz = QuranUz();
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 2),
      () {
        AppNavigator.pushReplacementNamed(RouteNames.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
