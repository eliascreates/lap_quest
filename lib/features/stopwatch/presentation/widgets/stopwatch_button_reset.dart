part of 'stopwatch_bottom_controls.dart';

class StopwatchButtonReset extends StatelessWidget {
  const StopwatchButtonReset({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopwatchBloc, StopwatchState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.totalDuration == Duration.zero
              ? null
              : () {
                  showDialog(
                    context: context,
                    builder: (BuildContext newContext) {
                      return BlocProvider.value(
                        value: context.read<StopwatchBloc>(),
                        child: const StopwatchResetDialog(),
                      );
                    },
                  );
                },
          child: const Text('Reset'),
        );
      },
    );
  }
}
