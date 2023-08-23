import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_quest/config/themes/app_theme.dart';
import 'features/stopwatch/presentation/bloc/stopwatch_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stopwatch App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: BlocProvider(
        create: (context) => StopwatchBloc(),
        child: const StopwatchPage(),
      ),
    );
  }
}

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final captionColor = textTheme.bodySmall?.color;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matrix Stopwatch'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Builder(builder: (context) {
              var currentDuration = context.select(
                  (StopwatchBloc bloc) => bloc.state.currentLapDuration);
              var totalDuration = context
                  .select((StopwatchBloc bloc) => bloc.state.totalDuration);

              return Column(
                children: [
                  Text(
                    formatDuration(totalDuration, showAllDigits: true),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    formatDuration(currentDuration),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              );
            }),
          ),
          BlocBuilder<StopwatchBloc, StopwatchState>(builder: (context, state) {
            final sortedList = List.from(state.lapHistory);

            sortedList.sort((a, b) => b.id.compareTo(a.id));
            return Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: sortedList.length,
                itemBuilder: (context, index) {
                  final lap = sortedList[index];
                  return ListTile(
                    title: Text(
                      'Lap ${lap.id}',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(formatDuration(lap.lapDuration),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: captionColor)),
                    trailing: Text(
                      formatDuration(
                        lap.totalDuration,
                      ),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            );
          }),
          const SizedBox(height: 20),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => context
                      .read<StopwatchBloc>()
                      .add(const StopwatchResetted()),
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
          ),
        ],
      ),
    );
  }

  String formatDuration(Duration duration, {bool showAllDigits = false}) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");

    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    String oneDigitMilliseconds =
        (duration.inMilliseconds.remainder(1000) ~/ 100).toString();

    if (showAllDigits) {
      return "${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}.$oneDigitMilliseconds";
    }
    return "${twoDigits(minutes)}:${twoDigits(seconds)}.$oneDigitMilliseconds";
  }
}
