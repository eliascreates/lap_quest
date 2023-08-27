part of 'activity_bloc.dart';

sealed class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object?> get props => [];
}

class ActivityCreated extends ActivityEvent {
  final String title;
  final String description;

  const ActivityCreated({required this.title, required this.description});
  @override
  List<Object> get props => [title, description];
}

class ActivityFetchedAll extends ActivityEvent {
  const ActivityFetchedAll();
}

class ActivityByIdFetched extends ActivityEvent {
  const ActivityByIdFetched({required this.activityId});

  final String activityId;

  @override
  List<Object> get props => [activityId];
}

class ActivityUpdated extends ActivityEvent {
  const ActivityUpdated(
      {required this.activityId,
      this.title,
      this.description,
      this.isComplete});

  final String activityId;
  final String? title;
  final String? description;
  final bool? isComplete;

  @override
  List<Object?> get props => [activityId, title, description, isComplete];
}

class ActivityDeleted extends ActivityEvent {
  const ActivityDeleted({required this.activityId});

  final String activityId;

  @override
  List<Object> get props => [activityId];
}

class ActivityToggleCompleted extends ActivityEvent {
  const ActivityToggleCompleted({required this.activityId});

  final String activityId;

  @override
  List<Object> get props => [activityId];
}

class ActivityClearCompleted extends ActivityEvent {
  const ActivityClearCompleted();
}
