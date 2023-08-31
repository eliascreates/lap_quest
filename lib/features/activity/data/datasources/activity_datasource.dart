import 'package:isar/isar.dart';

import 'package:lap_quest/core/error/exceptions.dart';

import '../../domain/entities/activity.dart';

abstract class ActivityDataSource {
  Future<ActivityEntity> createActivity({
    required String name,
    required List<Lap> laps,
  });
  Future<List<ActivityEntity>> getAllActivities();

  Future<ActivityEntity> updateActivity({
    required int id,
    String? name,
    List<Lap>? laps,
    bool? isFavorite,
  });
  Future<void> deleteActivity(int id);
}

class ActivityDataSourceImpl implements ActivityDataSource {
  final Isar isar;

  ActivityDataSourceImpl(this.isar);

  @override
  Future<ActivityEntity> createActivity({
    required String name,
    required List<Lap> laps,
  }) async {
    // TODO: implement createActivity
    final activity = ActivityEntity()..name = name;

    await isar.writeTxn(() async {
      await isar.activityEntitys.put(activity);
    });
    return activity;
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
  Future<ActivityEntity> updateActivity({
    required int id,
    String? name,
    List<Lap>? laps,
    bool? isFavorite,
  }) async {
    // TODO: implement updateActivity

    try {
      final activity = await isar.activityEntitys.get(id);

      if (activity != null) {
        await isar.writeTxn(() async {
          activity
            ..name = name ?? activity.name
            ..laps = laps ?? activity.laps
            ..isFavorite = isFavorite ?? activity.isFavorite;
          await isar.activityEntitys.put(activity);
        });
        return activity;
      }
      throw const CacheException();
    } catch (_) {
      throw const CacheException();
    }
  }
}
