import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lap_quest/core/usecases/usecases.dart';
import 'package:lap_quest/features/activity/domain/domain.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final GetAllActivities getAllActivities;
  final CreateActivity createActivity;
  final DeleteActivity deleteActivity;
  final UpdateActivity updateActivity;

  ActivityBloc({
    required this.getAllActivities,
    required this.createActivity,
    required this.deleteActivity,
    required this.updateActivity,
  }) : super(const ActivityState()) {
    on<ActivityCreated>(_onActivityCreated);
    on<ActivityFetchedAll>(_onActivityFetchedAll);
    on<ActivityUpdated>(_onActivityUpdated);
    on<ActivityDeleted>(_onActivityDeleted);
  }

  Future<void> _onActivityCreated(
    ActivityCreated event,
    Emitter<ActivityState> emit,
  ) async {
    final result = await createActivity(CreateActParams(name: event.name));

    emit(
      await result.fold(
        (failure) async {
          return state.copyWith(
              status: ActivityStatus.failure, errorMessage: failure.message);
        },
        (createdActivity) async {
          return state.copyWith(
            activities: <ActivityEntity>[...state.activities, createdActivity],
            status: ActivityStatus.success,
            errorMessage: null,
          );
        },
      ),
    );
  }

  Future<void> _onActivityFetchedAll(
    ActivityFetchedAll event,
    Emitter<ActivityState> emit,
  ) async {
    emit(state.copyWith(status: ActivityStatus.loading));
    final result = await getAllActivities(const NoParams());

    emit(
      await result.fold(
        (failure) async => state.copyWith(
            status: ActivityStatus.failure, errorMessage: failure.message),
        (activities) async => state.copyWith(
          activities: activities,
          status: ActivityStatus.success,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> _onActivityUpdated(
    ActivityUpdated event,
    Emitter<ActivityState> emit,
  ) async {
    emit(state.copyWith(status: ActivityStatus.loading));

    final result = await updateActivity(UpdateActParams(
      id: event.activityId,
      name: event.name,
      laps: event.laps,
      isFavorite: event.isFavorite,
    ));

    emit(
      await result.fold(
        (failure) async => state.copyWith(
            status: ActivityStatus.failure, errorMessage: failure.message),
        (modifiedAct) async {
          return state.copyWith(
            activities: state.activities
                .map((act) => act.id == modifiedAct.id ? modifiedAct : act)
                .toList(),
            status: ActivityStatus.success,
            errorMessage: null,
          );
        },
      ),
    );
  }

  Future<void> _onActivityDeleted(
    ActivityDeleted event,
    Emitter<ActivityState> emit,
  ) async {
    final result = await deleteActivity(DeleteActParams(id: event.activityId));

    emit(
      await result.fold(
        (failure) async => state.copyWith(
            status: ActivityStatus.failure, errorMessage: failure.message),
        (response) async {
          final updatedActivities = state.activities
              .where((act) => act.id != event.activityId)
              .toList();

          return state.copyWith(
              activities: updatedActivities, status: ActivityStatus.success);
        },
      ),
    );
  }
}
