import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
  }

  Future<void> _onPaused(
    StopwatchPaused event,
    Emitter<StopwatchState> emit,
  ) async {
    // TODO: implement event handler
  }

  Future<void> _onLapAdded(
    StopwatchLapAdded event,
    Emitter<StopwatchState> emit,
  ) async {
    // TODO: implement event handler
  }

  Future<void> _onResetted(
    StopwatchResetted event,
    Emitter<StopwatchState> emit,
  ) async {
    // TODO: implement event handler
  }

}
