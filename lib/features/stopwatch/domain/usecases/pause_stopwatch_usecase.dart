// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';
import 'package:lap_quest/features/stopwatch/domain/repositories/stopwatch_repository.dart';

import '../entities/stopwatch.dart';

class PauseStopwatchUsecase implements Usecase<void, PauseWatchParams> {
  final StopwatchRepository repository;
  PauseStopwatchUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(PauseWatchParams params) async {
    return await repository.pauseStopwatch(
      name: params.name,
      stopwatch: params.stopwatch,
    );
  }
}

class PauseWatchParams extends Equatable {
  final String name;
  final StopwatchEntity stopwatch;
  const PauseWatchParams({
    required this.name,
    required this.stopwatch,
  });

  @override
  List<Object?> get props => [name, stopwatch];
}
