import 'package:isar/isar.dart';
import 'package:lap_quest/features/stopwatch/domain/entities/stopwatch.dart';

part 'activity.g.dart';

@collection
class ActivityEntity {
  Id id = Isar.autoIncrement;
  late String name;
  final stopwatch = IsarLink<StopwatchEntity>();
}
