import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_quest/features/stopwatch/presentation/widgets/stopwatch_tile.dart';

import '../bloc/stopwatch_bloc.dart';

class StopwatchLapList extends StatelessWidget {
  const StopwatchLapList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopwatchBloc, StopwatchState>(
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
    });
  }
}
