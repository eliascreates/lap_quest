// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';
import 'package:lap_quest/features/stopwatch/domain/repositories/stopwatch_repository.dart';

import '../entities/entitites.dart' show StopwatchEntity;

class ResetStopwatchUsecase implements Usecase<void, ResetWatchParams> {
  final StopwatchRepository repository;
  ResetStopwatchUsecase(this.repository);
  
  @override
  Future<Either<Failure, void>> call(ResetWatchParams params) async {
    return await repository.resetStopwatch(
      name: params.name,
      stopwatch: params.stopwatch,
    );
  }
}

class ResetWatchParams extends Equatable {
  final String name;
  final StopwatchEntity stopwatch;
  const ResetWatchParams({
    required this.name,
    required this.stopwatch,
  });

  @override
  List<Object?> get props => [name, stopwatch];
}
