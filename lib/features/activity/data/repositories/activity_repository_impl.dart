import 'package:dartz/dartz.dart';

import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/features/activity/data/datasources/activity_datasource.dart';
import 'package:lap_quest/features/activity/domain/entities/activity.dart';
// import 'package:lap_quest/features/stopwatch/domain/entities/stopwatch.dart';
import 'package:lap_quest/features/activity/domain/repositories/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final ActivityDataSource dataSource;

  ActivityRepositoryImpl({required this.dataSource});

  @override
  Future<Either<CacheFailure, void>> createActivity({
    required String name,
    // required StopwatchEntity stopwatch,
  }) async {
    try {
      await dataSource.createActivity(
        name: name,
        // stopwatch: stopwatch,
      );
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure("Failed to create activity: $e"));
    }
  }

  @override
  Future<Either<CacheFailure, void>> deleteActivity({required int id}) async {
    try {
      await dataSource.deleteActivity(id);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure("Failed to delete activity: $e"));
    }
  }

  @override
  Future<Either<CacheFailure, List<ActivityEntity>>> getAllActivities() async {
    try {
      final activities = await dataSource.getAllActivities();
      return Right(activities);
    } catch (e) {
      return Left(CacheFailure("Failed to get all activities: $e"));
    }
  }

  @override
  Future<Either<CacheFailure, void>> updateActivity({
    required int id,
    required String name,
    // required StopwatchEntity stopwatch,
  }) async {
    try {
      await dataSource.updateActivity(
        id: id,
        name: name,
        // stopwatch: stopwatch,
      );
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure("Failed to update activity: $e"));
    }
  }
}
