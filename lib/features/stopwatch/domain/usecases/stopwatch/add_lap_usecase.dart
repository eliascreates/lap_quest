import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';

import '../../repositories/stopwatch_repository.dart';

class AddLapUseCase implements Usecase<void, AddLapParams> {
  final StopwatchRepository repository;

  const AddLapUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(AddLapParams params) async {
    return await repository.addLap(stopwatchId: params.stopwatchId);
  }
}

class AddLapParams extends Equatable {
  final int stopwatchId;

  const AddLapParams({required this.stopwatchId});

  @override
  List<Object?> get props => [stopwatchId];
}
