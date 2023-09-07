import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_quest/features/activity/presentation/bloc/activity_bloc.dart';
import 'package:lap_quest/features/stopwatch/presentation/bloc/stopwatch_bloc.dart';

class StopwatchResetDialog extends StatelessWidget {
  const StopwatchResetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Reset'),
      content: const Text(
        'Are you sure you want to reset the stopwatch?',
      ),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final jump = context.read<StopwatchBloc>()
              ..add(const StopwatchResetted());

            context.read<ActivityBloc>().add(
                  ActivityUpdated(
                    activityId: jump.activity.id,
                    laps: const [],
                  ),
                );
            Navigator.of(context).pop();
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
