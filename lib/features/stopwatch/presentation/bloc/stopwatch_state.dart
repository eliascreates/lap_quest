// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'stopwatch_bloc.dart';

enum StopwatchStatus { initial, running, paused, reset, failure }

class StopwatchState extends Equatable {
  final StopwatchStatus status;
  final StopwatchEntity? stopwatch;
  final String? errorMessage;
  final int duration;

  const StopwatchState({
    this.status = StopwatchStatus.initial,
    this.stopwatch,
    this.errorMessage,
    this.duration = 0,
  });

  @override
  List<Object?> get props => [status, stopwatch, errorMessage];

  StopwatchState copyWith({
    StopwatchStatus? status,
    StopwatchEntity? stopwatch,
    String? errorMessage,
    int? duration,
  }) {
    return StopwatchState(
      status: status ?? this.status,
      stopwatch: stopwatch ?? this.stopwatch,
      errorMessage: errorMessage ?? this.errorMessage,
      duration: duration ?? this.duration,
    );
  }
}
