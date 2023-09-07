import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'features/activity/domain/usecases/domain_usecases.dart';
import 'features/activity/presentation/bloc/activity_bloc.dart';
import 'service_locator.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityBloc(
        getAllActivities: di.sl<GetAllActivities>(),
        createActivity: di.sl<CreateActivity>(),
        deleteActivity: di.sl<DeleteActivity>(),
        updateActivity: di.sl<UpdateActivity>(),
      )..add(const ActivityFetchedAll()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stopwatch App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
