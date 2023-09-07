part of 'stopwatch_bottom_controls.dart';

class StopwatchButtonElapse extends StatelessWidget {
  const StopwatchButtonElapse({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopwatchBloc, StopwatchState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.status != StopwatchStatus.running
              ? null
              : () =>
                  context.read<StopwatchBloc>().add(const StopwatchElapsed()),
          child: const Text('Lap'),
        );
      },
    );
  }
}
