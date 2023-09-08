import 'package:dartz/dartz.dart';

import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/features/activity/domain/domain.dart';

import '../datasources/activity_datasource.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final ActivityDataSource dataSource;

  ActivityRepositoryImpl({required this.dataSource});

  @override
  Future<Either<CacheFailure, ActivityEntity>> createActivity({
    required String name,
    required List<Lap> laps,
    required bool isFavorite,
  }) async {
    try {
      final newActivity =
          await dataSource.createActivity(name: name, laps: laps);
      return Right(newActivity);
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
  Future<Either<CacheFailure, ActivityEntity>> updateActivity({
    required int id,
    String? name,
    List<Lap>? laps,
    bool? isFavorite,
  }) async {
    try {
      final updatedActivity = await dataSource.updateActivity(
        id: id,
        name: name,
        laps: laps,
        isFavorite: isFavorite,
      );
      return Right(updatedActivity);
    } catch (e) {
      return Left(CacheFailure("Failed to update activity: $e"));
    }
  }
}
