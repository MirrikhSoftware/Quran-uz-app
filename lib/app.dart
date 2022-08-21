import 'package:flutter/material.dart';
import 'package:quran/core/components/app_packages.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
      designSize: const Size(375.0, 812.0),
      builder: (ctx, w) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(),
      ),
    );
  }
}
