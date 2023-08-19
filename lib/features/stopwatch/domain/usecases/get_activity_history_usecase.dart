import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';

import '../entities/entitites.dart' show Lap;
import '../repositories/repositories.dart' show StopwatchRepository;

class GetActivityHistoryUseCase
    implements Usecase<List<Lap>, ActivityHistoryParams> {
  final StopwatchRepository repository;

  const GetActivityHistoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<Lap>>> call(ActivityHistoryParams params) async {
    return await repository.getActivityHistory(stopwatchId: params.stopwatchId);
  }
}

class ActivityHistoryParams extends Equatable {
  final int stopwatchId;

  const ActivityHistoryParams({required this.stopwatchId});

  @override
  List<Object?> get props => [stopwatchId];
}
