import 'package:lap_quest/features/stopwatch/domain/entities/stopwatch.dart';

class Activity {
  final String id;
  final String name;
  final StopwatchEntity stopwatch;

  Activity({
    required this.id,
    required this.name,
    required this.stopwatch,
  });
}