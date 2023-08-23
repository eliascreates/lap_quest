
import 'package:flutter/material.dart';
import 'package:lap_quest/core/constants/format_duration.dart';

import '../bloc/stopwatch_bloc.dart';

class StopwatchTile extends StatelessWidget {
  const StopwatchTile({super.key, required this.lap, required this.isSelected});
  
  final bool isSelected;
  final Lap lap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final captionColor = textTheme.bodySmall?.color;
    
    return ListTile(
      selected: isSelected,
      selectedTileColor: Theme.of(context).highlightColor,
      shape: BorderDirectional(
          bottom: BorderSide(width: 1, color: Colors.grey.withOpacity(0.1))),
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
  }
}
