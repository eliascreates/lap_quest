import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lap_quest/core/constants/format_duration.dart';
import '../bloc/stopwatch_bloc.dart';

class StopwatchDisplayHeader extends StatelessWidget {
  const StopwatchDisplayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Builder(builder: (context) {
        var currentDuration = context
            .select((StopwatchBloc bloc) => bloc.state.currentLapDuration);
        var totalDuration =
            context.select((StopwatchBloc bloc) => bloc.state.totalDuration);

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    formatDuration(totalDuration, showAllDigits: true),
                    softWrap: true,
                    textWidthBasis: TextWidthBasis.parent,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            Text(
              formatDuration(currentDuration),
              style: GoogleFonts.orbitron(
                textStyle: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        );
      }),
    );
  }
}
