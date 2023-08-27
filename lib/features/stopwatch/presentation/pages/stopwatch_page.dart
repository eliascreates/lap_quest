import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/stopwatch_bloc.dart';
import '../widgets/widgets.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Matrix Stopwatch')),
      body: BlocProvider(
        create: (context) => StopwatchBloc(),
        child: const StopwatchView(),
      ),
    );
  }
}

class StopwatchView extends StatelessWidget {
  const StopwatchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StopwatchDisplayHeader(),
        StopwatchLapList(),
        SizedBox(height: 20),
        StopwatchBottomControls(),
      ],
    );
  }
}
