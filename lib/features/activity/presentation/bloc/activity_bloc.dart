import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lap_quest/features/activity/domain/entities/activity.dart';
import 'package:lap_quest/features/activity/domain/usecases/domain_usecases.dart';

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
    //TODO: Implement ActivityCreated

  }

  Future<void> _onActivityFetchedAll(
    ActivityFetchedAll event,
    Emitter<ActivityState> emit,
  ) async {
    //TODO: Implement ActivityFetchedAll

  }

  Future<void> _onActivityUpdated(
    ActivityUpdated event,
    Emitter<ActivityState> emit,
  ) async {
    //TODO: Implement ActivityUpdated

  }

  Future<void> _onActivityDeleted(
    ActivityDeleted event,
    Emitter<ActivityState> emit,
  ) async {
    //TODO: Implement ActivityDeleted

  }
}
