import 'package:isar/isar.dart';

import 'package:lap_quest/core/error/exceptions.dart';

import '../../domain/domain.dart';

/// An abstract class defining the data source methods for managing activity data.
abstract class ActivityDataSource {
  /// Creates a new activity with the provided [name] and [laps].
  ///
  /// Returns the created [ActivityEntity].
  Future<ActivityEntity> createActivity({
    required String name,
    required List<Lap> laps,
  });

  /// Retrieves a list of all activities.
  ///
  /// Returns a list of [ActivityEntity] objects.
  Future<List<ActivityEntity>> getAllActivities();

  /// Updates an existing activity with the specified [id].
  ///
  /// Optionally, you can provide a new [name], a list of [laps], and set the [isFavorite] status.
  ///
  /// Returns the updated [ActivityEntity].
  Future<ActivityEntity> updateActivity({
    required int id,
    String? name,
    List<Lap>? laps,
    bool? isFavorite,
  });

  /// Deletes an activity with the specified [id].
  ///
  /// This action is irreversible.
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
    final activity = ActivityEntity()..name = name;

    await isar.writeTxn(() async {
      await isar.activityEntitys.put(activity);
    });
    return activity;
  }

  @override
  Future<void> deleteActivity(int id) async {
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
