

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_quest/core/constants/format_duration.dart';

import '../bloc/stopwatch_bloc.dart';

class StopwatchDisplayHeader extends StatelessWidget {
  const StopwatchDisplayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Builder(builder: (context) {
        var currentDuration = context
            .select((StopwatchBloc bloc) => bloc.state.currentLapDuration);
        var totalDuration =
            context.select((StopwatchBloc bloc) => bloc.state.totalDuration);

        return Column(
          children: [
            Text(
              formatDuration(totalDuration, showAllDigits: true),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              formatDuration(currentDuration),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        );
      }),
    );
  }
}
