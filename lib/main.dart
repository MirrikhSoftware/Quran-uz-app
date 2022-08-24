import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/app.dart';
import 'package:quran/hive_helper/hive_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInit.init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),

  );
  runApp(const App());
}

// flutter packages pub run build_runner build  --delete-conflicting-outputs