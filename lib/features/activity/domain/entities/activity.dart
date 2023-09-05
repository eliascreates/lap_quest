import 'package:isar/isar.dart';

part 'activity.g.dart';

@Collection()
class ActivityEntity {
  Id id = Isar.autoIncrement;
  late String name;
  List<Lap> laps = [];
  bool isFavorite = false;

  int get totallapDurationInMilliseconds {
    int totalDuration = 0;

    for (Lap lap in laps) {
      if (lap.lapDurationInMilliseconds != null) {
        totalDuration += lap.lapDurationInMilliseconds!;
      }
    }
    return totalDuration;
  }

  Lap? get bestLap {
    if (laps.isEmpty || laps.length == 1) {
      return null;
    }

    final bestLap = laps.reduce((currentBest, lap) {
      return lap.lapDurationInMilliseconds! <
              currentBest.lapDurationInMilliseconds!
          ? lap
          : currentBest;
    });

    return bestLap;
  }

  Lap? get worstLap {
    if (laps.isEmpty || laps.length == 1) {
      return null;
    }

    final worstLap = laps.reduce((currentWorst, lap) {
      return lap.lapDurationInMilliseconds! >
              currentWorst.lapDurationInMilliseconds!
          ? lap
          : currentWorst;
    });
    return worstLap;
  }
}

@embedded
class Lap {
  int? id = 0;
  int? lapDurationInMilliseconds;
  int? totalDurationInMilliseconds = 0;
  DateTime? timestamp;

  Lap() {
    timestamp = DateTime.now();
  }

  @ignore
  Duration get lapDuration {
    return Duration(milliseconds: lapDurationInMilliseconds ?? 0);
  }

  @ignore
  Duration get totalDuration {
    return Duration(milliseconds: totalDurationInMilliseconds ?? 0);
  }
}
