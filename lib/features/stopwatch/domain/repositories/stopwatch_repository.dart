import 'package:dartz/dartz.dart';

import 'package:lap_quest/core/error/failures.dart';

import '../entities/entitites.dart';

abstract class StopwatchRepository {
  Future<Either<Failure, void>> startStopwatch();

  Future<Either<Failure, void>> pauseStopwatch();

  Future<Either<Failure, void>> resetStopwatch({required int stopwatchId});

  Future<Either<Failure, void>> addLap({required int stopwatchId});

  Future<Either<Failure, StopwatchEntity>> getStopwatch({
    required int stopwatchId,
  });

  Future<Either<Failure, List<Lap>>> getActivityHistory({
    required int stopwatchId,
  });
}
