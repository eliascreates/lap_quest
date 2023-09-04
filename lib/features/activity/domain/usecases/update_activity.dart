import 'package:dartz/dartz.dart';
import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';
import 'package:lap_quest/features/activity/domain/entities/activity.dart';

import '../repositories/activity_repository.dart';

class UpdateActivity implements Usecase<ActivityEntity, UpdateActParams> {
  final ActivityRepository repository;

  UpdateActivity(this.repository);

  @override
  Future<Either<Failure, ActivityEntity>> call(UpdateActParams params) async {
    return await repository.updateActivity(
      id: params.id,
      name: params.name,
      laps: params.laps,
      isFavorite: params.isFavorite,
    );
  }
}

class UpdateActParams {
  final int id;
  final String? name;
  final List<Lap>? laps;
  final bool? isFavorite;

  const UpdateActParams({
    required this.id,
    this.name,
    this.laps,
    this.isFavorite,
  });
}
