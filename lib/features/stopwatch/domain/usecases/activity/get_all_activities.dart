import 'package:dartz/dartz.dart';
import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';

import '../../repositories/repositories.dart';

class GetAllActivities extends Usecase<void, NoParams> {
  final ActivityRepository repository;

  GetAllActivities(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.getAllActivities();
  }
}
