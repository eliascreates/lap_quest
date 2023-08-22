// stopwatch_event.dart
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

// class StopwatchResumed extends StopwatchEvent {
//   const StopwatchResumed();
// }

class StopwatchResetted extends StopwatchEvent {
  const StopwatchResetted();
}

class StopwatchElapsed extends StopwatchEvent {
  const StopwatchElapsed();
}

class _StopwatchUpdated extends StopwatchEvent {
  const _StopwatchUpdated();
}
