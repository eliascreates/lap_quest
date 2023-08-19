part of 'stopwatch_bloc.dart';

enum StopwatchStatus { initial, running, paused, reset, failure }

class StopwatchState extends Equatable {
  final StopwatchStatus status;
  final StopwatchEntity? stopwatch;
  final String? errorMessage;

  const StopwatchState({
    this.status = StopwatchStatus.initial,
    this.stopwatch,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, stopwatch, errorMessage];
}
