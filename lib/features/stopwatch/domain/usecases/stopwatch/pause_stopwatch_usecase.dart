import 'package:dartz/dartz.dart';

import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';
import 'package:lap_quest/features/stopwatch/domain/repositories/stopwatch_repository.dart';

class PauseStopwatchUsecase implements Usecase<void, NoParams> {
  final StopwatchRepository repository;
  const PauseStopwatchUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.pauseStopwatch();
  }
}
