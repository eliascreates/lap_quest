import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/format_duration.dart';
import '../bloc/stopwatch_bloc.dart';

class StopwatchLapList extends StatelessWidget {
  const StopwatchLapList({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final captionColor = textTheme.bodySmall?.color;
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
            return ListTile(
              title: Text(
                'Lap ${lap.id}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(formatDuration(lap.lapDuration),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: captionColor)),
              trailing: Text(
                formatDuration(
                  lap.totalDuration,
                ),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      );
    });
  }
}
