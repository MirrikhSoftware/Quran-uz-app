import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quran/core/core.dart';
import 'package:quran/hive_helper/app_prefs.dart';
import 'package:quran/hive_helper/hive_boxes.dart';
import 'package:quran/models/verse/verse_model.dart';
import 'package:quran/routes/app_navigator.dart';
import 'package:quran/routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    if (!AppPrefs.hasSaved) {
      _saveToStorage();
    } else {

      Timer(
        const Duration(seconds: 1),
        () {
          AppNavigator.pushReplacementNamed(RouteNames.home);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Future _saveToStorage() async {

    final QuranUz quranUz = QuranUz();

    Map<int, VerseModel> entries = {};
    for (var verse in quranUz.verses) {
      VerseModel verseModel = VerseModel.fromJson(verse.toJson());
      entries[verseModel.key] = verseModel;
    }
    await HiveBoxes.verseBox.putAll(entries);
    await AppPrefs.setSaved();
    AppNavigator.pushNamedAndRemoveUntil(RouteNames.home);
  }
}
