part of 'stopwatch_bottom_controls.dart';

class StopwatchButtonStartPause extends StatelessWidget {
  const StopwatchButtonStartPause({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopwatchBloc, StopwatchState>(
      builder: (context, state) {
        return state.status != StopwatchStatus.running
            ? ElevatedButton.icon(
                onPressed: () =>
                    context.read<StopwatchBloc>().add(const StopwatchStarted()),
                icon: const Icon(Icons.play_arrow_rounded),
                label: const Text('Start'),
              )
            : ElevatedButton.icon(
                onPressed: () =>
                    context.read<StopwatchBloc>().add(const StopwatchPaused()),
                icon: const Icon(Icons.pause_rounded),
                label: const Text('Pause'),
              );
      },
    );
  }
}
