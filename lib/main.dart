import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/stopwatch/presentation/bloc/stopwatch_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch App',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Builder(builder: (context) {
              return Text(
                formatDuration(context
                    .select((StopwatchBloc bloc) => bloc.state.duration)),
                style: const TextStyle(
                    fontSize: 64.0, fontWeight: FontWeight.bold),
              );
            }),
          ),
          BlocBuilder<StopwatchBloc, StopwatchState>(builder: (context, state) {
            return Expanded(
              child: ListView.builder(
                itemCount: state.lapHistory.length,
                itemBuilder: (context, index) {
                  final lapDuration = state.lapHistory[index];
                  return ListTile(
                    title: Text(
                      'Lap ${index + 1}: ${formatDuration(lapDuration)}',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  );
                },
              ),
            );
          }),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () =>
                    context.read<StopwatchBloc>().add(const StopwatchStarted()),
                child: const Text('Start'),
              ),
              ElevatedButton(
                onPressed: () =>
                    context.read<StopwatchBloc>().add(const StopwatchPaused()),
                child: const Text('Pause'),
              ),
              ElevatedButton(
                onPressed: () => context
                    .read<StopwatchBloc>()
                    .add(const StopwatchResetted()),
                child: const Text('Reset'),
              ),
              ElevatedButton(
                onPressed: () =>
                    context.read<StopwatchBloc>().add(const StopwatchElapsed()),
                child: const Text('Lap'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");

    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    String oneDigitMilliseconds =
        (duration.inMilliseconds.remainder(1000) ~/ 100)
            .toString(); // Using ~/ 100 to get the first digit

    return "${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}.$oneDigitMilliseconds";
  }
}
