// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  ActivityState copyWith({
    List<ActivityEntity>? activities,
    ActivityStatus? status,
    String? errorMessage,
  }) {
    return ActivityState(
      activities: activities ?? this.activities,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
