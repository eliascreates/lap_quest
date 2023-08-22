// ignore_for_file: public_member_api_docs, sort_constructors_first
// stopwatch_state.dart
part of 'stopwatch_bloc.dart';

enum StopwatchStatus { initial, running, paused }

class StopwatchState extends Equatable {
  final StopwatchStatus status;
  final Duration duration;
  final List<Duration> lapHistory;

  const StopwatchState({
    this.status = StopwatchStatus.initial,
    this.duration = Duration.zero,
    this.lapHistory = const [],
  });

  StopwatchState copyWith({
    StopwatchStatus? status,
    Duration? duration,
    List<Duration>? lapHistory,
  }) {
    return StopwatchState(
      status: status ?? this.status,
      duration: duration ?? this.duration,
      lapHistory: lapHistory ?? this.lapHistory,
    );
  }

  @override
  List<Object?> get props => [status, duration, lapHistory];

}
