import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lap_quest/core/usecases/usecases.dart';

import '../../domain/entities/entitites.dart';
import '../../domain/usecases/domain_usecases.dart';

part 'stopwatch_event.dart';
part 'stopwatch_state.dart';

class StopwatchBloc extends Bloc<StopwatchEvent, StopwatchState> {
  final StartStopwatchUsecase startStopwatchUseCase;
  final PauseStopwatchUsecase pauseStopwatchUseCase;
  final ResetStopwatchUsecase resetStopwatchUseCase;
  final AddLapUsecase addLapUseCase;

  StopwatchBloc({
    required this.startStopwatchUseCase,
    required this.pauseStopwatchUseCase,
    required this.resetStopwatchUseCase,
    required this.addLapUseCase,
  }) : super(const StopwatchState()) {
    on<StopwatchStarted>(_onStarted);
    on<StopwatchPaused>(_onPaused);
    on<StopwatchLapAdded>(_onLapAdded);
    on<StopwatchResetted>(_onResetted);
  }
  Future<void> _onStarted(
    StopwatchStarted event,
    Emitter<StopwatchState> emit,
  ) async {
    // TODO: implement event handler

    final result = await startStopwatchUseCase(const NoParams());
    emit(state.copyWith(status: StopwatchStatus.running));

    await result.fold(
      (l) async => emit(state.copyWith(
        errorMessage: "Fuck",
        status: StopwatchStatus.failure,
      )),
      (r) async {
        var jump = startStopwatchUseCase.repository.getTimeStream();

        jump.forEach((Duration duration) => emit(state.copyWith(
              duration: duration.inMilliseconds,
              status: StopwatchStatus.running,
            )));
      },
    );

    emit(state.copyWith(status: StopwatchStatus.running));
  }

  Future<void> _onPaused(
    StopwatchPaused event,
    Emitter<StopwatchState> emit,
  ) async {
    // TODO: implement event handler
    emit(state.copyWith(status: StopwatchStatus.paused));
  }

  Future<void> _onLapAdded(
    StopwatchLapAdded event,
    Emitter<StopwatchState> emit,
  ) async {
    // TODO: implement event handler
    emit(state.copyWith(status: StopwatchStatus.running));
  }

  Future<void> _onResetted(
    StopwatchResetted event,
    Emitter<StopwatchState> emit,
  ) async {
    // TODO: implement event handler
    emit(state.copyWith(status: StopwatchStatus.reset));
  }
}
