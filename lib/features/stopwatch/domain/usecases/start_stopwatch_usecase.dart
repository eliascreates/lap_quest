import 'package:dartz/dartz.dart';

import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';

import '../repositories/stopwatch_repository.dart';


class StartStopwatchUsecase implements Usecase<void, NoParams> {
  final StopwatchRepository repository;

  const StartStopwatchUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.startStopwatch();
  }
}
