import 'package:dartz/dartz.dart';
import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';

import '../../../stopwatch/domain/entities/stopwatch.dart';
import '../repositories/activity_repository.dart';

class UpdateActivity implements Usecase<void, UpdateActParams> {
  final ActivityRepository repository;

  UpdateActivity(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateActParams params) async {
    return await repository.updateActivity(
      id: params.id,
      name: params.name,
      stopwatch: params.stopwatch,
    );
  }
}

class UpdateActParams {
  final int id;
  final String name;
  final StopwatchEntity stopwatch;

  const UpdateActParams({
    required this.id,
    required this.name,
    required this.stopwatch,
  });
}
