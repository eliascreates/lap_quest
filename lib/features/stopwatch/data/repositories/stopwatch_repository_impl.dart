import 'package:dartz/dartz.dart';

import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/features/stopwatch/data/datasources/stopwatch_datasource.dart';
import 'package:lap_quest/features/stopwatch/domain/entities/stopwatch.dart';
import 'package:lap_quest/features/stopwatch/domain/repositories/stopwatch_repository.dart';

class StopwatchRepositoryImpl implements StopwatchRepository {
  final StopwatchDataSource dataSource;

  StopwatchRepositoryImpl({required this.dataSource});

  @override
  Future<Either<CacheFailure, void>> addLap({required int stopwatchId}) async {
    try {
      await dataSource.addLap(stopwatchId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure("Failed to add lap: $e"));
    }
  }

  @override
  Future<Either<CacheFailure, List<Lap>>> getActivityHistory({
    required int stopwatchId,
  }) async {
    try {
      final history = await dataSource.getActivityHistory(stopwatchId);
      return Right(history);
    } catch (e) {
      return Left(CacheFailure("Failed to get activity history: $e"));
    }
  }

  @override
  Future<Either<CacheFailure, StopwatchEntity>> getStopwatch({
    required int stopwatchId,
  }) async {
    try {
      final stopwatch = await dataSource.getStopwatch(stopwatchId);
      return Right(stopwatch);
    } catch (e) {
      return Left(CacheFailure("Failed to get stopwatch: $e"));
    }
  }

  @override
  Future<Either<CacheFailure, void>> pauseStopwatch() async {
    try {
      await dataSource.pauseStopwatch();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure("Failed to pause stopwatch: $e"));
    }
  }

  @override
  Future<Either<CacheFailure, void>> resetStopwatch(
      {required int stopwatchId}) async {
    try {
      await dataSource.resetStopwatch(stopwatchId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure("Failed to reset stopwatch: $e"));
    }
  }

  @override
  Future<Either<CacheFailure, void>> startStopwatch() async {
    try {
      await dataSource.startStopwatch();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure("Failed to start stopwatch: $e"));
    }
  }
}
