part of 'activity_bloc.dart';

sealed class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object?> get props => [];
}

class ActivityCreated extends ActivityEvent {
  final String name;

  const ActivityCreated({required this.name});
  @override
  List<Object> get props => [name];
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
    this.name,
    this.isFavorite,
    this.laps,
  });

  final int activityId;
  final String? name;
  final bool? isFavorite;
  final List<Lap>? laps;

  @override
  List<Object?> get props => [activityId, name, isFavorite, laps];
}

class ActivityDeleted extends ActivityEvent {
  const ActivityDeleted({required this.activityId});

  final int activityId;

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
