import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:lap_quest/core/error/exceptions.dart';

import '../../domain/entities/entitites.dart';

abstract class ActivityDataSource {
  Future<void> createActivity({
    required String name,
    required StopwatchEntity stopwatch,
  });
  Future<List<ActivityEntity>> getAllActivities();

  Future<void> updateActivity({
    required int id,
    required String name,
    required StopwatchEntity stopwatch,
  });
  Future<void> deleteActivity(int id);
}

class ActivityDataSourceImpl implements ActivityDataSource {
  late Isar isar;

  ActivityDataSourceImpl(this.isar) {
    init();
  }

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([ActivityEntitySchema], directory: dir.path);
  }

  @override
  Future<void> createActivity(
      {required String name, required StopwatchEntity stopwatch}) async {
    // TODO: implement createActivity
    final activity = ActivityEntity()
      ..name = name
      ..stopwatch.value = stopwatch;

    await isar.writeTxn(() async {
      await isar.activityEntitys.put(activity);
      await isar.stopwatchEntitys.put(stopwatch);
      await activity.stopwatch.save();
    });
  }

  @override
  Future<void> deleteActivity(int id) async {
    // TODO: implement deleteActivity
    try {
      final activity = await isar.activityEntitys.get(id);

      if (activity == null) throw const CacheException();

      await isar.writeTxn(() async {
        await isar.activityEntitys.delete(id);
      });
    } catch (_) {
      throw const CacheException();
    }
  }

  @override
  Future<List<ActivityEntity>> getAllActivities() async {
    // TODO: implement getAllActivities
    try {
      final collection = isar.collection<ActivityEntity>();
      final activities = await collection.where().findAll();
      if (activities.isEmpty) throw const CacheException();
      return activities;
    } catch (_) {
      throw const CacheException();
    }
  }

  @override
  Future<void> updateActivity({
    required int id,
    required String name,
    required StopwatchEntity stopwatch,
  }) async {
    // TODO: implement updateActivity

    try {
      final activity = await isar.activityEntitys.get(id);

      if (activity != null) {
        await isar.writeTxn(() async {
          activity
            ..name = name
            ..stopwatch.value = stopwatch;
          await isar.activityEntitys.put(activity);
        });
      }
    } catch (_) {
      throw const CacheException();
    }
  }
}
