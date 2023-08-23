import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Matrix Stopwatch')),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
