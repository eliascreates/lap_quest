import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'features/activity/data/datasources/activity_datasource.dart';
import 'features/activity/data/repositories/activity_repository_impl.dart';
import 'features/activity/domain/entities/activity.dart';
import 'features/activity/domain/repositories/activity_repository.dart';
import 'features/activity/domain/usecases/domain_usecases.dart';
// import 'features/stopwatch/data/datasources/stopwatch_datasource.dart';
// import 'features/stopwatch/data/repositories/stopwatch_repository_impl.dart';
// import 'features/stopwatch/domain/entities/stopwatch.dart';
// import 'features/stopwatch/domain/repositories/stopwatch_repository.dart';
// import 'features/stopwatch/domain/usecases/domain_usecases.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //? FEATURES

  //! Stopwatch

  // //Use cases
  // sl.registerLazySingleton(() => GetStopwatchUsecase(sl()));
  // sl.registerLazySingleton(() => GetStopwatchHistoryUseCase(sl()));
  // sl.registerLazySingleton(() => StartStopwatchUsecase(sl()));
  // sl.registerLazySingleton(() => AddLapUsecase(sl()));
  // sl.registerLazySingleton(() => PauseStopwatchUsecase(sl()));
  // sl.registerLazySingleton(() => ResetStopwatchUsecase(sl()));

  // //Data sources
  // sl.registerLazySingleton<StopwatchDataSource>(
  //   () => StopwatchDataSourceImpl(sl()),
  // );

  // //Repository
  // sl.registerLazySingleton<StopwatchRepository>(
  //   () => StopwatchRepositoryImpl(dataSource: sl()),
  // );

  //! Activity

  //Use cases
  sl.registerLazySingleton(() => CreateActivity(sl()));
  sl.registerLazySingleton(() => GetAllActivities(sl()));
  sl.registerLazySingleton(() => UpdateActivity(sl()));
  sl.registerLazySingleton(() => DeleteActivity(sl()));

  //Data sources
  sl.registerLazySingleton<ActivityDataSource>(
    () => ActivityDataSourceImpl(sl()),
  );

  //Repository
  sl.registerLazySingleton<ActivityRepository>(
    () => ActivityRepositoryImpl(dataSource: sl()),
  );

  //? EXTERNALS

  final dir = await getApplicationDocumentsDirectory();
  final Isar isar = await Isar.open(
    [ActivityEntitySchema],
    directory: dir.path,
  );

  sl.registerLazySingleton(() => isar);
}
