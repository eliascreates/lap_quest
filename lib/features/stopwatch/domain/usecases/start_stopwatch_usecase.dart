// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';

import '../entities/stopwatch.dart';
import '../repositories/repositories.dart' show StopwatchRepository;

class StartStopwatchUseCase implements Usecase<void, StartWatchParams> {
  final StopwatchRepository repository;

  const StartStopwatchUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(StartWatchParams params) async {
    return await repository.startStopwatch(
      name: params.name,
      stopwatch: params.stopwatch,
    );
  }
}

class StartWatchParams extends Equatable {
  final String name;
  final StopwatchEntity stopwatch;
  const StartWatchParams({
    required this.name,
    required this.stopwatch,
  });

  @override
  List<Object?> get props => [name, stopwatch];
}
