import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lap_quest/features/activity/activity.dart';

import '../bloc/stopwatch_bloc.dart';
import '../widgets/widgets.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key, required this.activity});
  final ActivityEntity activity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(activity.name)),
      body: BlocProvider(
        create: (context) => StopwatchBloc(activity: activity),
        child: const StopwatchView(),
      ),
    );
  }
}

class StopwatchView extends StatelessWidget {
  const StopwatchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StopwatchDisplayHeader(),
        StopwatchLapList(),
        SizedBox(height: 20),
        StopwatchBottomControls(),
      ],
    );
  }
}
