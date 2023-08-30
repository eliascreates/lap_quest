// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:lap_quest/core/error/failures.dart';
// import 'package:lap_quest/core/usecases/usecases.dart';
// import 'package:lap_quest/features/stopwatch/domain/entities/stopwatch.dart';

// import '../repositories/stopwatch_repository.dart';


// class GetStopwatchHistoryUseCase
//     implements Usecase<List<Lap>, ActivityHistoryParams> {
//   final StopwatchRepository repository;

//   const GetStopwatchHistoryUseCase(this.repository);

//   @override
//   Future<Either<Failure, List<Lap>>> call(ActivityHistoryParams params) async {
//     return await repository.getStopwatchHistory(stopwatchId: params.stopwatchId);
//   }
// }

// class ActivityHistoryParams extends Equatable {
//   final int stopwatchId;

//   const ActivityHistoryParams({required this.stopwatchId});

//   @override
//   List<Object?> get props => [stopwatchId];
// }
