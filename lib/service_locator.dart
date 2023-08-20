import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:lap_quest/features/stopwatch/data/datasources/datasources.dart';
import 'package:lap_quest/features/stopwatch/domain/entities/entitites.dart'
    show ActivityEntitySchema, StopwatchEntitySchema;
import 'package:lap_quest/features/stopwatch/domain/repositories/repositories.dart';
import 'package:lap_quest/features/stopwatch/domain/usecases/domain_usecases.dart';

import 'features/stopwatch/data/repositories/repositories_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //? FEATURES

  //! Stopwatch

  //Use cases
  sl.registerLazySingleton(() => GetStopwatchUsecase(sl()));
  sl.registerLazySingleton(() => GetActivityHistoryUseCase(sl()));
  sl.registerLazySingleton(() => StartStopwatchUsecase(sl()));
  sl.registerLazySingleton(() => AddLapUsecase(sl()));
  sl.registerLazySingleton(() => PauseStopwatchUsecase(sl()));
  sl.registerLazySingleton(() => ResetStopwatchUsecase(sl()));

  //Data sources
  sl.registerLazySingleton<StopwatchDataSource>(
    () => StopwatchDataSourceImpl(sl()),
  );

  //Repository
  sl.registerLazySingleton<StopwatchRepository>(
    () => StopwatchRepositoryImpl(dataSource: sl()),
  );


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
    [ActivityEntitySchema, StopwatchEntitySchema],
    directory: dir.path,
  );

  sl.registerLazySingleton(() => isar);
}
