import 'package:flutter/material.dart';
import 'package:quran/core/theme/app_theme.dart';
import 'package:quran/routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRoutes routes = AppRoutes();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().indigo,
      navigatorKey: AppNavigator.navigatorKey,
      initialRoute: RouteNames.initial,
      onGenerateRoute: routes.onGenerateRoute,
    );
  }
}
