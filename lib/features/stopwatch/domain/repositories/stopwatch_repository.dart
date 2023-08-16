import '../entities/entitites.dart';

abstract class StopwatchRepository {
  Future<void> startStopwatch(Activity activity);
  Future<void> pauseStopwatch(Activity activity);
  Future<void> resetStopwatch(Activity activity);
  Future<void> addLap(Activity activity, Duration lapDuration);
  Future<StopwatchEntity> getStopwatch(Activity activity);
}
