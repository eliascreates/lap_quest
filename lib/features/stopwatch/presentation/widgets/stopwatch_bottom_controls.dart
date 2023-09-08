import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/stopwatch_bloc.dart';
import 'stopwatch_reset_dialog.dart';

part 'stopwatch_button_elapse.dart';
part 'stopwatch_button_reset.dart';
part 'stopwatch_button_start_pause.dart';

class StopwatchBottomControls extends StatelessWidget {
  const StopwatchBottomControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: MediaQuery.of(context).size.height * 0.2,
      alignment: Alignment.center,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StopwatchButtonReset(),
          StopwatchButtonStartPause(),
          StopwatchButtonElapse(),
        ],
      ),
    );
  }
}
