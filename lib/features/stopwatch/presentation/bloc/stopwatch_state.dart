part of 'stopwatch_bloc.dart';

abstract class StopwatchState extends Equatable {
  const StopwatchState();  

  @override
  List<Object> get props => [];
}
class StopwatchInitial extends StopwatchState {}
