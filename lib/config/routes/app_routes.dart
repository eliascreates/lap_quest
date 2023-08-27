import 'package:flutter/material.dart';
import 'package:lap_quest/features/activity/presentation/pages/activity_page.dart';
import 'package:lap_quest/features/stopwatch/presentation/pages/stopwatch_page.dart';

class AppRoutes {
  //Splash Page
  static const String splash = '/';

  //Activity Page
  static const String activity = '/';

  //Activity Detail Page - Activity - Stopwatch
  static const String activityDetails = '/activity/detail';

  //Settings Page
  static const String settingsPage = 'settings';

  const AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case activity:
        return MaterialPageRoute(
          builder: (_) => const ActivityPage(),
        );
      case activityDetails:
        // if (settings.arguments is Stopwatch) {
        return MaterialPageRoute(
          builder: (_) => const StopwatchPage(),
        );
      // }
      // return _errorRoute();
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
