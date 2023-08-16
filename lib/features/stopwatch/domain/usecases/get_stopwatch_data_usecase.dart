// lib/domain/usecases/get_activity_history_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lap_quest/core/error/failures.dart';

import 'package:lap_quest/core/usecases/usecases.dart';
import '../entities/entitites.dart' show StopwatchEntity;
import '../repositories/stopwatch_repository.dart';

class GetActivityHistoryUseCase
    implements Usecase<StopwatchEntity, GetStopwatchParams> {
  final StopwatchRepository repository;
  const GetActivityHistoryUseCase(this.repository);

  @override
  Future<Either<Failure, StopwatchEntity>> call(
      GetStopwatchParams params) async {
    return await repository.getStopwatch(
      name: params.name,
      stopwatch: params.stopwatch,
    );
  }
}

class GetStopwatchParams extends Equatable {
  final String name;
  final StopwatchEntity stopwatch;
  const GetStopwatchParams({
    required this.name,
    required this.stopwatch,
  });

  @override
  List<Object?> get props => [name, stopwatch];
}
