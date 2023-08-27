part of 'activity_bloc.dart';

enum ActivityStatus { initial, loading, success, failure }

class ActivityState extends Equatable {
  const ActivityState({
    this.activities = const <ActivityEntity>[],
    this.status = ActivityStatus.initial,
    this.errorMessage,
  });

  final List<ActivityEntity> activities;
  final ActivityStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [activities, status, errorMessage];
}
