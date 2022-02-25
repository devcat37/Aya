// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:aya/internal/pages/health_survey_page/health_survey_page.dart';
import 'package:aya/internal/pages/workspace/workspace.dart';
import 'package:aya/internal/services/settings.dart';
import 'package:aya/internal/utils/infrastructure.dart';
import 'package:aya/presentation/pages/splash_screen_view/splash_screen_view.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
    );

    return MaterialApp(
      title: Settings.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: whiteColor,
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          headline4: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          button: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (routeSettings) {
        Route? route;

        switch (routeSettings.name) {
          case SplashScreenView.routeName:
            route = MaterialPageRoute(builder: (context) => const SplashScreenView());
            break;
          case HealthSurveyPage.routeName:
            route = MaterialPageRoute(builder: (context) => const HealthSurveyPage());
            break;
          case Workspace.routeName:
            route = MaterialPageRoute(builder: (context) => const Workspace());
            break;
        }

        return route;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
