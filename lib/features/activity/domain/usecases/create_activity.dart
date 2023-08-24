import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';
import 'package:lap_quest/features/activity/domain/repositories/activity_repository.dart';
import 'package:lap_quest/features/stopwatch/domain/entities/stopwatch.dart';


class CreateActivity implements Usecase<void, CreateActParams> {
  final ActivityRepository repository;

  CreateActivity(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateActParams params) async {
    return await repository.createActivity(
      name: params.name,
      stopwatch: params.stopwatch,
    );
  }
}

class CreateActParams extends Equatable {
  final String name;
  final StopwatchEntity stopwatch;

  const CreateActParams({
    required this.name,
    required this.stopwatch,
  });

  @override
  List<Object?> get props => [name, stopwatch];
}
