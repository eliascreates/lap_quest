import 'package:get_it/get_it.dart';
import 'package:lap_quest/features/stopwatch/data/datasources/activity_datasource.dart';
import 'package:lap_quest/features/stopwatch/data/datasources/stopwatch_datasource.dart';
import 'package:lap_quest/features/stopwatch/data/repositories/activity_repository_impl.dart';
import 'package:lap_quest/features/stopwatch/data/repositories/stopwatch_repository_impl.dart';
import 'package:lap_quest/features/stopwatch/domain/repositories/repositories.dart';
import 'package:lap_quest/features/stopwatch/domain/usecases/domain_usecases.dart';

final sl = GetIt.instance;

void init() {
  //? FEATURES

  //! Stopwatch

  //Use cases
  sl.registerLazySingleton(() => GetStopwatchUsecase(sl()));
  sl.registerLazySingleton(() => GetActivityHistoryUseCase(sl()));
  sl.registerLazySingleton(() => StartStopwatchUseCase(sl()));
  sl.registerLazySingleton(() => AddLapUseCase(sl()));
  sl.registerLazySingleton(() => PauseStopwatchUsecase(repository: sl()));
  sl.registerLazySingleton(() => ResetStopwatchUsecase(sl()));

  //Repository
  sl.registerLazySingleton<StopwatchRepository>(
    () => StopwatchRepositoryImpl(dataSource: sl()),
  );

  //Data sources
  sl.registerLazySingleton<StopwatchDataSource>(
    () => StopwatchDataSourceImpl(sl()),
  );

  //! Activity
  //Use cases
  //TODO: Put Activity Usecases
  
  //Repository
  sl.registerLazySingleton<ActivityRepository>(
    () => ActivityRepositoryImpl(dataSource: sl()),
  );

  //Data sources
  sl.registerLazySingleton<ActivityDataSource>(
    () => ActivityDataSourceImpl(sl()),
  );

  //? EXTERNALS
}
