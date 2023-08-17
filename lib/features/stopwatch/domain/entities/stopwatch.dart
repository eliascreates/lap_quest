import 'package:isar/isar.dart';

part 'stopwatch.g.dart';

@Collection()
class StopwatchEntity {
  Id id = Isar.autoIncrement;

  late List<Lap> laps;
  late int totalMilliDuration; //* In Milliseconds
}

@embedded
class Lap {
  int? duration; //* In Milliseconds
  DateTime? timestamp;
}
