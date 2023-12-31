import 'package:flutter/material.dart';

import 'package:lap_quest/config/routes/app_routes.dart';
import 'package:lap_quest/core/constants/constants.dart';

import '../../domain/entities/activity.dart';
import 'activity_bottom_sheet_list.dart';
import 'activity_like_button.dart';

part 'activity_card_lap_info.dart';

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
    final captionColor = textTheme.bodySmall?.color;
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
                  ActivityLikeButton(activity: activity),
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
                  Icon(Icons.timelapse_outlined, color: captionColor),
                  const SizedBox(width: 6.0),
                  RichText(
                    text: TextSpan(
                      children: [
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
                            showAllDigits: true,
                          ),
                          style: textTheme.titleMedium?.copyWith(
                            fontSize: 16.0,
                            color: textTheme.headlineMedium?.color,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
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
      backgroundColor: Theme.of(context).colorScheme.secondary,
      builder: (BuildContext context) {
        return ActivityBottomSheetList(activity: activity);
      },
    );
  }
}
