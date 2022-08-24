import 'package:flutter/material.dart';
import 'package:quran/bloc/sura/sura_bloc.dart';
import 'package:quran/core/components/app_packages.dart';
import 'package:quran/core/theme/app_theme.dart';
import 'package:quran/routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRoutes routes = AppRoutes();

    return ScreenUtilInit(
      designSize: const Size(375.0, 812.0),
      builder: (ctx, w) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SuraBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().light,
          navigatorKey: AppNavigator.navigatorKey,
          initialRoute: RouteNames.initial,
          onGenerateRoute: routes.onGenerateRoute,
        ),
      ),
    );
  }
}
