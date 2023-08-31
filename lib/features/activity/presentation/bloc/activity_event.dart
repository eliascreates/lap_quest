part of 'activity_bloc.dart';

sealed class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object?> get props => [];
}

class ActivityCreated extends ActivityEvent {
  final String title;

  const ActivityCreated({required this.title});
  @override
  List<Object> get props => [title];
}

class ActivityFetchedAll extends ActivityEvent {
  const ActivityFetchedAll();
}

// class ActivityByIdFetched extends ActivityEvent {
//   const ActivityByIdFetched({required this.activityId});

//   final String activityId;

//   @override
//   List<Object> get props => [activityId];
// }

class ActivityUpdated extends ActivityEvent {
  const ActivityUpdated({
    required this.activityId,
    this.title,
    this.isFavorite,
  });

  final String activityId;
  final String? title;
  final bool? isFavorite;

  @override
  List<Object?> get props => [activityId, title, isFavorite];
}

class ActivityDeleted extends ActivityEvent {
  const ActivityDeleted({required this.activityId});

  final String activityId;

  @override
  List<Object> get props => [activityId];
}

class ActivityToggleFavorite extends ActivityEvent {
  const ActivityToggleFavorite({required this.activityId});

  final String activityId;

  @override
  List<Object> get props => [activityId];
}

class ActivityClearCompleted extends ActivityEvent {
  const ActivityClearCompleted();
}
