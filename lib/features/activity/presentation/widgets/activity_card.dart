import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_quest/config/routes/app_routes.dart';
import 'package:lap_quest/core/constants/format_duration.dart';
import 'package:lap_quest/features/activity/presentation/bloc/activity_bloc.dart';

import '../../domain/entities/activity.dart';
import 'activity_bottom_sheet.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
    required this.activity,
    required this.isFavorite,
  });

  final ActivityEntity activity;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleColor = textTheme.headlineMedium?.color;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.activityDetails,
          arguments: activity),
      onLongPress: () => _showBottomSheet(context),
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      activity.name,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: titleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      //TODO: Handle favorite button press
                      context.read<ActivityBloc>().add(
                            ActivityUpdated(
                              activityId: activity.id,
                              isFavorite: !activity.isFavorite,
                            ),
                          );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActivityLapInfo(
                    label: "Fastest Lap",
                    lapTime: Duration(
                      milliseconds:
                          activity.bestLap?.lapDurationInMilliseconds ?? 0,
                    ),
                  ),
                  ActivityLapInfo(
                    label: "Slowest Lap",
                    lapTime: Duration(
                      milliseconds:
                          activity.worstLap?.lapDurationInMilliseconds ?? 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.grey),
                  const SizedBox(width: 6.0),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Total Duration: ",
                        style: textTheme.labelLarge?.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: formatDuration(
                            Duration(
                                milliseconds:
                                    activity.totallapDurationInMilliseconds),
                            showAllDigits: true),
                        style: textTheme.titleMedium?.copyWith(
                          fontSize: 16.0,
                          color: textTheme.headlineMedium?.color,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadiusDirectional.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context) {
        return ActivityBottomSheet(activity: activity);
      },
    );
  }
}

class ActivityLapInfo extends StatelessWidget {
  const ActivityLapInfo({
    super.key,
    required this.label,
    required this.lapTime,
  });

  final String label;
  final Duration lapTime;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final captionColor = textTheme.bodySmall?.color;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4.0),
        Row(
          children: [
            Icon(Icons.timer, color: captionColor),
            const SizedBox(width: 6.0),
            Text(
              formatDuration(lapTime),
              style: TextStyle(color: captionColor),
            ),
          ],
        ),
      ],
    );
  }
}
