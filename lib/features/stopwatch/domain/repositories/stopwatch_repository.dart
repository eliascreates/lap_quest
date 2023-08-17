import 'package:dartz/dartz.dart';

import 'package:lap_quest/core/error/failures.dart';

import '../entities/entitites.dart';

abstract class StopwatchRepository {
  Future<Either<Failure, void>> startStopwatch({
    required String name,
    required StopwatchEntity stopwatch,
  });

  Future<Either<Failure, void>> pauseStopwatch({
    required String name,
    required StopwatchEntity stopwatch,
  });

  Future<Either<Failure, void>> resetStopwatch({
    required String name,
    required StopwatchEntity stopwatch,
  });

  Future<Either<Failure, void>> addLap({
    required String name,
    required StopwatchEntity stopwatch,
    required int lapMilliDuration,
  });

  Future<Either<Failure, StopwatchEntity>> getStopwatch({
    required String name,
    required StopwatchEntity stopwatch,
  });

  Future<Either<Failure, List<Lap>>> getActivityHistory({
    required String name,
    required StopwatchEntity stopwatch,
  });
}
