import 'package:flutter/material.dart';
import 'package:quran/routes/routes.dart';
import 'package:quran/view/screens/home/home_screen.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return _route(const HomeScreen());

      default:
        return _route(const HomeScreen());
    }
  }

  MaterialPageRoute _route(Widget route) =>
      MaterialPageRoute(builder: (_) => route);
}
