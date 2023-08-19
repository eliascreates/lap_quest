import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lap_quest/core/error/failures.dart';

import 'package:lap_quest/core/usecases/usecases.dart';
import '../../entities/entitites.dart' show StopwatchEntity;
import '../../repositories/stopwatch_repository.dart';

class GetStopwatchUsecase
    implements Usecase<StopwatchEntity, GetStopwatchParams> {
  final StopwatchRepository repository;
  const GetStopwatchUsecase(this.repository);

  @override
  Future<Either<Failure, StopwatchEntity>> call(
      GetStopwatchParams params) async {
    return await repository.getStopwatch(stopwatchId: params.stopwatchId);
  }
}

class GetStopwatchParams extends Equatable {
  final int stopwatchId;

  const GetStopwatchParams({required this.stopwatchId});

  @override
  List<Object?> get props => [stopwatchId];
}
