

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/stopwatch_bloc.dart';

class StopwatchBottomControls extends StatelessWidget {
  const StopwatchBottomControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () =>
                context.read<StopwatchBloc>().add(const StopwatchResetted()),
            child: const Text('Reset'),
          ),
          BlocBuilder<StopwatchBloc, StopwatchState>(
            builder: (context, state) {
              return state.status != StopwatchStatus.running
                  ? ElevatedButton.icon(
                      onPressed: () => context
                          .read<StopwatchBloc>()
                          .add(const StopwatchStarted()),
                      icon: const Icon(Icons.play_arrow_rounded),
                      label: const Text('Play'),
                    )
                  : ElevatedButton.icon(
                      onPressed: () => context
                          .read<StopwatchBloc>()
                          .add(const StopwatchPaused()),
                      icon: const Icon(Icons.pause_rounded),
                      label: const Text('Pause'),
                    );
            },
          ),
          BlocBuilder<StopwatchBloc, StopwatchState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state.status != StopwatchStatus.running
                    ? null
                    : () => context
                        .read<StopwatchBloc>()
                        .add(const StopwatchElapsed()),
                child: const Text('Lap'),
              );
            },
          ),
        ],
      ),
    );
  }
}