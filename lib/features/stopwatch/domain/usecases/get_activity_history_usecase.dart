// lib/domain/usecases/get_activity_history_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';

import '../entities/stopwatch.dart';
import '../repositories/stopwatch_repository.dart';

class GetActivityHistoryUseCase
    implements Usecase<List<Lap>, ActivityHistoryParams> {
  final StopwatchRepository repository;

  const GetActivityHistoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<Lap>>> call(ActivityHistoryParams params) async {
    return await repository.getActivityHistory(
      name: params.name,
      stopwatch: params.stopwatch,
    );
  }
}

class ActivityHistoryParams extends Equatable {
  final String name;
  final StopwatchEntity stopwatch;

  const ActivityHistoryParams({
    required this.name,
    required this.stopwatch,
  });

  @override
  List<Object?> get props => [name, stopwatch];
}