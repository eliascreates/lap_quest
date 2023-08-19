import 'package:dartz/dartz.dart';

import 'package:lap_quest/core/error/failures.dart';

import '../entities/entitites.dart';

abstract class ActivityRepository {
  Future<Either<Failure, void>> createActivity({
    required String name,
    required StopwatchEntity stopwatch,
  });

  Future<Either<Failure, List<ActivityEntity>>> getAllActivities();

  Future<Either<Failure, void>> updateActivity({
    required int id,
    required String name,
    required StopwatchEntity stopwatch,
  });

  Future<Either<Failure, void>> deleteActivity({required int id});
}
