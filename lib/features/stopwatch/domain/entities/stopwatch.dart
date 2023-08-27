// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  int get bestLap {
    if (laps.isEmpty) {
      return 0;
    }

    final bestLap = laps.reduce((currentBest, lap) {
      return lap.durationInMilliseconds! < currentBest.durationInMilliseconds!
          ? lap
          : currentBest;
    });

    return bestLap.durationInMilliseconds!;
  }
}

@embedded
class Lap {
  int? durationInMilliseconds;
  DateTime? timestamp;
}
