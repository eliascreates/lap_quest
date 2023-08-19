// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:lap_quest/core/error/failures.dart';
import 'package:lap_quest/core/usecases/usecases.dart';
import 'package:lap_quest/features/stopwatch/domain/repositories/repositories.dart';

class DeleteActivity extends Usecase<void, DeleteActParams> {
  final ActivityRepository repository;

  DeleteActivity(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteActParams params) async {
    return await repository.deleteActivity(id: params.id);
  }
}

class DeleteActParams {
  final int id;
  DeleteActParams({required this.id});
}
