
class StopwatchEntity {
  final List<Lap> laps;
  final Duration totalDuration;

  StopwatchEntity({
    required this.laps,
    required this.totalDuration,
  });
}

class Lap {
  final Duration duration;
  final DateTime timestamp;

  Lap({
    required this.duration,
    required this.timestamp,
  });
}
