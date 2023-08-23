import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Matrix Stopwatch')),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StopwatchDisplayHeader(),
          StopwatchLapList(),
          SizedBox(height: 20),
          StopwatchBottomControls(),
        ],
      ),
    );
  }
}
