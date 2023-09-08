import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lap_quest/features/activity/activity.dart';

import '../bloc/stopwatch_bloc.dart';
import 'stopwatch_tile.dart';

class StopwatchLapList extends StatelessWidget {
  const StopwatchLapList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StopwatchBloc, StopwatchState>(
      listenWhen: (previous, current) =>
          previous.lapHistory != current.lapHistory,
      listener: (context, state) {
        context.read<ActivityBloc>().add(
              ActivityUpdated(
                activityId: state.activity!.id,
                laps: state.lapHistory,
              ),
            );
      },
      builder: (context, state) {
        final sortedList = List.from(state.lapHistory);

        sortedList.sort((a, b) => b.id.compareTo(a.id));
        return Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: sortedList.length,
            itemBuilder: (context, index) {
              final lap = sortedList[index];
              return StopwatchTile(
                lap: lap,
                isSelected: state.lapHistory.last.id == lap.id,
              );
            },
          ),
        );
      },
    );
  }
}
