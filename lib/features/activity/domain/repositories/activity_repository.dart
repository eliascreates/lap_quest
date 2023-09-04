import 'package:dartz/dartz.dart';

import 'package:lap_quest/core/error/failures.dart';

import '../entities/activity.dart';

abstract class ActivityRepository {
  Future<Either<Failure, ActivityEntity>> createActivity({
    required String name,
    required List<Lap> laps,
    required bool isFavorite,
  });

  Future<Either<Failure, List<ActivityEntity>>> getAllActivities();

  Future<Either<Failure, ActivityEntity>> updateActivity(
      {required int id, String? name, List<Lap>? laps, bool? isFavorite});

  Future<Either<Failure, void>> deleteActivity({required int id});
}
