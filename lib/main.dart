import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/debug/bloc_observer.dart';
import 'config/themes/app_theme.dart';
import 'features/stopwatch/presentation/bloc/stopwatch_bloc.dart';
import 'features/stopwatch/presentation/pages/stopwatch_page.dart';

void main() {
  Bloc.observer = LapQuestObserver();
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
      home: BlocProvider(
        create: (context) => StopwatchBloc(),
        child: const StopwatchPage(),
      ),
    );
  }
}
