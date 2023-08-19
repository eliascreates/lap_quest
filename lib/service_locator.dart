import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:lap_quest/features/stopwatch/data/datasources/activity_datasource.dart';
import 'package:lap_quest/features/stopwatch/data/datasources/stopwatch_datasource.dart';
import 'package:lap_quest/features/stopwatch/data/repositories/activity_repository_impl.dart';
import 'package:lap_quest/features/stopwatch/data/repositories/stopwatch_repository_impl.dart';
import 'package:lap_quest/features/stopwatch/domain/entities/entitites.dart';
import 'package:lap_quest/features/stopwatch/domain/repositories/repositories.dart';
import 'package:lap_quest/features/stopwatch/domain/usecases/domain_usecases.dart';
import 'package:path_provider/path_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
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
  sl.registerLazySingleton(() => CreateActivity(sl()));
  sl.registerLazySingleton(() => GetAllActivities(sl()));
  sl.registerLazySingleton(() => UpdateActivity(sl()));
  sl.registerLazySingleton(() => DeleteActivity(sl()));

  //Repository
  sl.registerLazySingleton<ActivityRepository>(
    () => ActivityRepositoryImpl(dataSource: sl()),
  );

  //Data sources
  sl.registerLazySingleton<ActivityDataSource>(
    () => ActivityDataSourceImpl(sl()),
  );

  //? EXTERNALS
  
  final dir = await getApplicationDocumentsDirectory();
  final Isar isar = await Isar.open(
    [ActivityEntitySchema, StopwatchEntitySchema],
    directory: dir.path,
  );

  sl.registerLazySingleton(() => isar);
}
