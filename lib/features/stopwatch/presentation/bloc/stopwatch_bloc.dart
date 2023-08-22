import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'stopwatch_event.dart';
part 'stopwatch_state.dart';

class StopwatchBloc extends Bloc<StopwatchEvent, StopwatchState> {
  Stopwatch stopwatch = Stopwatch();
  StreamSubscription<Duration>? _stopwatchStreamSubscription;

  @override
  Future<void> close() {
    _stopwatchStreamSubscription?.cancel();
    return super.close();
  }

  StopwatchBloc() : super(const StopwatchState()) {
    on<StopwatchStarted>(_onStopwatchStarted);
    on<StopwatchPaused>(_onStopwatchPaused);
    // on<StopwatchResumed>(_onStopwatchResumed);
    on<StopwatchResetted>(_onStopwatchResetted);
    on<StopwatchElapsed>(_onStopwatchElapsed);
    on<_StopwatchUpdated>(_onUpdated);
  }

  void _onStopwatchStarted(
    StopwatchStarted event,
    Emitter<StopwatchState> emit,
  ) async {
    if (!stopwatch.isRunning) {
      _stopwatchStreamSubscription?.cancel();
      stopwatch.start();
      _stopwatchStreamSubscription = elapsedDurationStream(
        stopwatch: stopwatch,
      ).listen((elapsedDuration) {
        add(const _StopwatchUpdated());
      });
    }
  }

  Stream<Duration> elapsedDurationStream({required Stopwatch stopwatch}) {
    return Stream.periodic(
      const Duration(milliseconds: 100), // Adjust the interval as needed
      (_) => stopwatch.elapsed,
    );
  }

  void _onStopwatchPaused(
    StopwatchPaused event,
    Emitter<StopwatchState> emit,
  ) async {
    if (stopwatch.isRunning) {
      stopwatch.stop();
      _stopwatchStreamSubscription?.pause();
      emit(state.copyWith(
          status: StopwatchStatus.paused, duration: stopwatch.elapsed));
    }
  }

  // void _onStopwatchResumed(
  //   StopwatchResumed event,
  //   Emitter<StopwatchState> emit,
  // ) async {
  //   if (!stopwatch.isRunning) {
  //     stopwatch.start();
  //     _stopwatchStreamSubscription?.resume();

  //   }
  // }

  void _onStopwatchResetted(
    StopwatchResetted event,
    Emitter<StopwatchState> emit,
  ) async {
    stopwatch.reset();
    emit(const StopwatchState(
      status: StopwatchStatus.initial,
      duration: Duration.zero,
      lapHistory: [],
    ));
  }

  void _onStopwatchElapsed(
    StopwatchElapsed event,
    Emitter<StopwatchState> emit,
  ) async {
    if (stopwatch.isRunning) {
      final lapDuration = stopwatch.elapsed;
      emit(state.copyWith(
        lapHistory: [...state.lapHistory, lapDuration],
        duration: stopwatch.elapsed,
      ));
    }
  }

  void _onUpdated(
    _StopwatchUpdated event,
    Emitter<StopwatchState> emit,
  ) async {
    emit(
      state.copyWith(
        status: StopwatchStatus.running,
        duration: stopwatch.elapsed,
      ),
    );
  }
}
