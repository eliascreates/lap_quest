part of 'stopwatch_bloc.dart';

abstract class StopwatchEvent extends Equatable {
  const StopwatchEvent();

  @override
  List<Object?> get props => [];
}

class StopwatchStarted extends StopwatchEvent {
  const StopwatchStarted();
}

class StopwatchPaused extends StopwatchEvent {
  const StopwatchPaused();
}

class StopwatchResetted extends StopwatchEvent {
  final int stopwatchId;
  const StopwatchResetted({required this.stopwatchId});

  @override
  List<Object?> get props => [stopwatchId];
}

class StopwatchLapAdded extends StopwatchEvent {
  final int stopwatchId;

  const StopwatchLapAdded({required this.stopwatchId});

  @override
  List<Object?> get props => [stopwatchId];
}
