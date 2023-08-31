import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';
import 'package:lap_quest/features/activity/domain/repositories/activity_repository.dart';

import '../entities/activity.dart';

class CreateActivity implements Usecase<ActivityEntity, CreateActParams> {
  final ActivityRepository repository;

  CreateActivity(this.repository);

  @override
  Future<Either<Failure, ActivityEntity>> call(CreateActParams params) async {
    return await repository.createActivity(
      name: params.name,
      laps: [],
      isFavorite: false,
    );
  }
}

class CreateActParams extends Equatable {
  final String name;

  const CreateActParams({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}
