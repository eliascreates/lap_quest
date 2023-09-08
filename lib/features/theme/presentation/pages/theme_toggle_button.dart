import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_quest/features/theme/presentation/cubit/theme_cubit.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeCubit>().state;
    final isDark = state == ThemeState.dark ? true : false;

    return IconButton(
      onPressed: () => context.read<ThemeCubit>().toggleTheme(),
      iconSize: 30,
      splashRadius: 20,
      icon: AnimatedRotation(
        turns: isDark ? 0 : 1,
        duration: const Duration(milliseconds: 1000),
        child: AnimatedCrossFade(
          firstChild: const Icon(Icons.light_mode),
          secondChild: const Icon(Icons.dark_mode),
          firstCurve: Curves.easeInOutSine,
          secondCurve: Curves.easeInOutSine,
          crossFadeState:
              isDark ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 900),
        ),
      ),
    );
  }
}
