import 'package:dartz/dartz.dart';
import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';

import '../entities/activity.dart';
import '../repositories/activity_repository.dart';

class GetAllActivities extends Usecase<List<ActivityEntity>, NoParams> {
  final ActivityRepository repository;

  GetAllActivities(this.repository);

  @override
  Future<Either<Failure, List<ActivityEntity>>> call(NoParams params) async {
    return await repository.getAllActivities();
  }
}
