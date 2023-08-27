
import 'package:flutter/material.dart';
import 'package:lap_quest/core/constants/format_duration.dart';

import '../../domain/entities/activity.dart';

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
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.symmetric(horizontal: 10),
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
                      style: const TextStyle(
                        fontSize: 20.0,
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
                      // Handle favorite button press
                      // You can implement this logic here
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActivityLapInfo(
                      label: "Best Lap", lapTime: Duration.zero),
                  ActivityLapInfo(
                      label: "Last Lap", lapTime: Duration.zero),
                ],
              ),
              const SizedBox(height: 12.0),
              const Row(
                children: [
                  Icon(Icons.access_time, color: Colors.grey),
                  SizedBox(width: 6.0),
                  Text(
                    "Total Duration: ${'activity.totalDuration'}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
            const Icon(Icons.timer, color: Colors.grey),
            const SizedBox(width: 6.0),
            Text(
              formatDuration(lapTime),
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
