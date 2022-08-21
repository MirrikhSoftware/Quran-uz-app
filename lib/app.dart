import 'package:flutter/material.dart';
import 'package:quran/core/components/app_packages.dart';
import 'package:quran/routes/app_route.dart';
import 'package:quran/routes/route_names.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRoutes routes = AppRoutes();
    return ScreenUtilInit(
      designSize: const Size(375.0, 812.0),
      builder: (ctx, w) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.home,
        onGenerateRoute: routes.onGenerateRoute,
      ),
    );
  }
}
