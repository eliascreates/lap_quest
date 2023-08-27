import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';
import 'package:lap_quest/features/stopwatch/domain/repositories/stopwatch_repository.dart';

class ResetStopwatchUsecase implements Usecase<void, ResetWatchParams> {
  final StopwatchRepository repository;
  ResetStopwatchUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(ResetWatchParams params) async {
    return await repository.resetStopwatch(stopwatchId: params.stopwatchId);
  }
}

class ResetWatchParams extends Equatable {
  final int stopwatchId;

  const ResetWatchParams({required this.stopwatchId});

  @override
  List<Object?> get props => [stopwatchId];
}
