import 'package:dartz/dartz.dart';
import 'package:lap_quest/core/error/failures.dart';
import '../entities/entitites.dart' show Activity;

abstract class ActivityRepository {
  Future<Either<Failure, void>> createActivity(Activity activity);
  Future<Either<Failure, List<Activity>>> getAllActivities();
  Future<Either<Failure, void>> updateActivity(Activity activity);
  Future<Either<Failure, void>> deleteActivity(Activity activity);
}
