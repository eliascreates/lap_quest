import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:lap_quest/core/error/exceptions.dart';

import '../../domain/entities/entitites.dart';

abstract class StopwatchDataSource {
  Future<void> startStopwatch();
  Future<void> pauseStopwatch();
  Future<void> resetStopwatch(int stopwatchId);
  Future<void> addLap(int stopwatchId);
  Future<StopwatchEntity> getStopwatch(int stopwatchId);
  Future<List<Lap>> getActivityHistory(int stopwatchId);
}

class StopwatchDataSourceImpl implements StopwatchDataSource {
  late Isar isar;
  late IsarCollection<StopwatchEntity> stopwatches;

  final Stopwatch _currentStopwatch = Stopwatch();

  final StreamController<Duration> _timeStreamController =
      StreamController<Duration>.broadcast();

  Stream<Duration> get timeStream => _timeStreamController.stream;

  void _updateTime() {
    _timeStreamController.add(_currentStopwatch.elapsed);
  }

  StopwatchDataSourceImpl(this.isar) {
    init();
  }

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([StopwatchEntitySchema], directory: dir.path);
    stopwatches = isar.collection<StopwatchEntity>();
  }

  @override
  Future<void> startStopwatch() async {
    if (!_currentStopwatch.isRunning) {
      _currentStopwatch.start();
      _updateTime();
    }
    throw UnimplementedError();
  }

  @override
  Future<void> addLap(int stopwatchId) async {
    try {
      final stopwatch = await stopwatches.get(stopwatchId);
      Lap newLap;
      if (_currentStopwatch.isRunning) {
        newLap = Lap()
          ..durationInMilliseconds = _currentStopwatch.elapsed.inMilliseconds
          ..timestamp = DateTime.now();
        stopwatch?.laps.add(newLap);

        _updateTime();
      }
      if (stopwatch == null) throw const CacheException();

      await isar.writeTxn(() async {
        await isar.stopwatchEntitys.put(stopwatch);
      });

      return Future.value();
    } catch (e) {
      throw const CacheException();
    }
  }

  @override
  Future<StopwatchEntity> getStopwatch(int stopwatchId) async {
    try {
      final stopwatch = await stopwatches.get(stopwatchId);

      if (stopwatch != null) return stopwatch;

      throw const CacheException();
    } catch (e) {
      throw const CacheException();
    }
  }

  @override
  Future<void> pauseStopwatch() async {
    // TODO: implement pauseStopwatch
    if (_currentStopwatch.isRunning) {
      _currentStopwatch.stop();
    }

    throw UnimplementedError();
  }

  @override
  Future<void> resetStopwatch(int stopwatchId) async {
    // TODO: implement resetStopwatch
    try {
      final stopwatch = await stopwatches.get(stopwatchId);
      _currentStopwatch.reset();
      stopwatch?.laps.clear();
      _updateTime();
    } catch (e) {
      throw const CacheException();
    }
  }

  @override
  Future<List<Lap>> getActivityHistory(int stopwatchId) async {
    // TODO: implement getActivityHistory
    try {
      final stopwatch = await stopwatches.get(stopwatchId);
      if (stopwatch != null) return stopwatch.laps;
      throw const CacheException();
    } catch (_) {
      throw const CacheException();
    }
  }
}
