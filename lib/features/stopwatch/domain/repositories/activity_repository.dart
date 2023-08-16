import '../entities/entitites.dart' show Activity;

abstract class ActivityRepository {
  Future<void> createActivity(Activity activity);
  Future<List<Activity>> getAllActivities();
  Future<void> updateActivity(Activity activity);
  Future<void> deleteActivity(Activity activity);
}