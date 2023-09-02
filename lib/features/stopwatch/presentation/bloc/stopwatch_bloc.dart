import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lap_quest/features/activity/domain/entities/activity.dart';

part 'stopwatch_event.dart';
part 'stopwatch_state.dart';

class StopwatchBloc extends Bloc<StopwatchEvent, StopwatchState> {
  final ActivityEntity activity;
  Stopwatch stopwatch = Stopwatch();
  StreamSubscription<Duration>? _stopwatchStreamSubscription;

  @override
  Future<void> close() {
    _stopwatchStreamSubscription?.cancel();
    return super.close();
  }

  StopwatchBloc({required this.activity})
      : super(StopwatchState(
          activity: activity,
          lapHistory: activity.laps,
        )) {
    on<StopwatchStarted>(_onStopwatchStarted);
    on<StopwatchPaused>(_onStopwatchPaused);
    on<StopwatchResetted>(_onStopwatchResetted);
    on<StopwatchElapsed>(_onStopwatchElapsed);
    on<_StopwatchUpdated>(_onUpdated);
  }

  void _onStopwatchStarted(
    StopwatchStarted event,
    Emitter<StopwatchState> emit,
  ) async {
    if (!stopwatch.isRunning) {
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
      const Duration(milliseconds: 10),
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
          status: StopwatchStatus.paused,
          currentLapDuration: stopwatch.elapsed));
    }
  }

  void _onStopwatchResetted(
    StopwatchResetted event,
    Emitter<StopwatchState> emit,
  ) async {
    stopwatch
      ..stop()
      ..reset();
    _stopwatchStreamSubscription?.cancel();
    emit(
      const StopwatchState(
        currentLapDuration: Duration.zero,
        lapHistory: [],
        status: StopwatchStatus.paused,
      ),
    );
  }

  void _onStopwatchElapsed(
    StopwatchElapsed event,
    Emitter<StopwatchState> emit,
  ) async {
    if (stopwatch.isRunning) {
      final lapDuration = stopwatch.elapsed;
      Lap lap;
      if (state.lapHistory.isEmpty) {
        // lap = Lap(
        //   id: 1,
        //   totalDuration: Duration.zero + lapDuration,
        //   lapDuration: lapDuration,
        // );
        final tempLap = Lap();
        lap = tempLap
          ..id = 1
          ..totalDurationInMilliseconds =
              Duration.zero.inMilliseconds + lapDuration.inMilliseconds
          ..lapDurationInMilliseconds = lapDuration.inMilliseconds;
      } else {
        // lap = Lap(
        //   id: state.lapHistory.length + 1,
        //   totalDuration: state.lapHistory.last.totalDuration + lapDuration,
        //   lapDuration: lapDuration,
        // );
        lap = Lap()
          ..id = state.lapHistory.length + 1
          ..totalDurationInMilliseconds =
              state.lapHistory.last.totalDurationInMilliseconds! +
                  lapDuration.inMilliseconds
          ..lapDurationInMilliseconds = lapDuration.inMilliseconds;
      }
      final updatedState = state.copyWith(
          lapHistory: [...state.lapHistory, lap],
          currentLapDuration: stopwatch.elapsed,
          status: StopwatchStatus.running);

      emit(updatedState);

      stopwatch.reset();
      stopwatch.start();
    }
  }

  void _onUpdated(
    _StopwatchUpdated event,
    Emitter<StopwatchState> emit,
  ) async {
    emit(
      state.copyWith(
          status: StopwatchStatus.running,
          currentLapDuration: stopwatch.elapsed),
    );
  }
}
