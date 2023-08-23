// stopwatch_state.dart
part of 'stopwatch_bloc.dart';

enum StopwatchStatus { initial, running, paused }

class StopwatchState extends Equatable {
  final Duration currentLapDuration;
  final List<Lap> lapHistory;
  final StopwatchStatus status;

  const StopwatchState({
    this.currentLapDuration = Duration.zero,
    this.lapHistory = const [],
    this.status = StopwatchStatus.initial,
  });

  Duration get totalDuration {
    if (lapHistory.isEmpty) return currentLapDuration;
    return lapHistory.last.totalDuration + currentLapDuration;
  }

  StopwatchState copyWith({
    Duration? currentLapDuration,
    List<Lap>? lapHistory,
    StopwatchStatus? status,
  }) {
    return StopwatchState(
      currentLapDuration: currentLapDuration ?? this.currentLapDuration,
      lapHistory: lapHistory ?? this.lapHistory,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [status, currentLapDuration, totalDuration, lapHistory];
}

class Lap {
  final int id;
  final Duration totalDuration;
  final Duration lapDuration;

  const Lap({
    this.id = 0,
    this.totalDuration = Duration.zero,
    this.lapDuration = Duration.zero,
  });
}
