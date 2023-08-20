import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_quest/features/stopwatch/domain/usecases/domain_usecases.dart';
import 'package:lap_quest/features/stopwatch/presentation/bloc/stopwatch_bloc.dart';
import 'service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch App',
      home: BlocProvider<StopwatchBloc>(
        create: (context) => StopwatchBloc(
          startStopwatchUseCase: sl<StartStopwatchUsecase>(),
          pauseStopwatchUseCase: sl<PauseStopwatchUsecase>(),
          resetStopwatchUseCase: sl<ResetStopwatchUsecase>(),
          addLapUseCase: sl<AddLapUsecase>(),
        ),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final stopwatchBloc = BlocProvider.of<StopwatchBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Stopwatch App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<StopwatchBloc, StopwatchState>(
              buildWhen: (previous, current) =>
                  previous.duration != current.duration,
              builder: (context, state) {
                if (state.status == StopwatchStatus.running) {
                  return Text(state.duration.toString());
                } else if (state.status == StopwatchStatus.paused) {
                  return Text(state.duration.toString());
                } else {
                  return const Text('Initial');
                }
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    stopwatchBloc.add(const StopwatchStarted());
                  },
                  child: const Icon(Icons.play_arrow),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    stopwatchBloc.add(const StopwatchPaused());
                  },
                  child: const Icon(Icons.pause),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    stopwatchBloc.add(const StopwatchResetted(stopwatchId: 1));
                  },
                  child: const Icon(Icons.stop),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    stopwatchBloc.add(const StopwatchLapAdded(stopwatchId: 1));
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
