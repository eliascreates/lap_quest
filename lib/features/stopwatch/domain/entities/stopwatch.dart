import 'package:isar/isar.dart';

part 'stopwatch.g.dart';

@Collection()
class StopwatchEntity {
  Id id = Isar.autoIncrement;

  List<Lap> laps = [];

  int get totalDurationInMilliseconds {
    int totalDuration = 0;

    for (Lap lap in laps) {
      if (lap.durationInMilliseconds != null) {
        totalDuration += lap.durationInMilliseconds!;
      }
    }
    return totalDuration;
  }
}

@embedded
class Lap {
  int? durationInMilliseconds;
  DateTime? timestamp;
}
