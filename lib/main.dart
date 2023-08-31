import 'package:flutter/material.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'service_locator.dart' as di;

void main() async {
  await di.init();
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
