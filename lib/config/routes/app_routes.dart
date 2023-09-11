import 'package:flutter/material.dart';

import 'package:lap_quest/features/activity/activity.dart';
import 'package:lap_quest/features/home/home.dart';
import 'package:lap_quest/features/stopwatch/stopwatch.dart';

class AppRoutes {
  //Splash Page
  // static const String splash = '/';

  //Home Page
  static const String home = '/';

  //Activity Detail Page - Activity to Stopwatch
  static const String activityDetails = '/activity/detail';

  //Settings Page
  static const String settingsPage = 'settings';

  const AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case activityDetails:
        if (settings.arguments is ActivityEntity) {
          return MaterialPageRoute(
            builder: (_) => StopwatchPage(
              activity: settings.arguments as ActivityEntity,
            ),
          );
        }
        return _errorRoute();
      case settingsPage:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Placeholder(),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text('Route not found!')),
      ),
    );
  }
}
