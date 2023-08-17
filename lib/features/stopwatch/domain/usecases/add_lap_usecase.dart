import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/stopwatch.dart';
import '../repositories/stopwatch_repository.dart';

class AddLapUseCase implements Usecase<void, AddLapParams> {
  final StopwatchRepository repository;

  const AddLapUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(AddLapParams params) async {
    return await repository.addLap(
      name: params.name,
      stopwatch: params.stopwatch,
      lapMilliDuration: params.lapMilliDuration,
    );
  }
}

class AddLapParams extends Equatable {
  final String name;
  final StopwatchEntity stopwatch;
  final int lapMilliDuration;
  const AddLapParams(
      {required this.name,
      required this.stopwatch,
      required this.lapMilliDuration});

  @override
  List<Object?> get props => [name, stopwatch];
}
