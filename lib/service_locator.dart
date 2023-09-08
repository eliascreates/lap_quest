import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'features/activity/activity.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  //? FEATURES

  //! Activity, Stopwatch

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

  //*Isar
  final dir = await getApplicationDocumentsDirectory();
  final Isar isar = await Isar.open(
    [ActivityEntitySchema],
    directory: dir.path,
  );

  sl.registerLazySingleton(() => isar);

  //* Hydrated Bloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
}
