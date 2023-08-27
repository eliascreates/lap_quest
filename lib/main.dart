import 'package:flutter/material.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
// import 'config/debug/bloc_observer.dart';

void main() {
  // Bloc.observer = LapQuestObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stopwatch App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.activity,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
