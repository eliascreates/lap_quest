import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_quest/features/activity/presentation/pages/activity_page.dart';
import 'package:lap_quest/features/home/presentation/cubit/home_cubit.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);
    final theme = Theme.of(context);

    return Scaffold(
      body: IndexedStack(
        index: selectedTab.index,
        children: [
          const ActivityPage(),
          Center(
            child: Text(
              'Ticket Activities',
              style: theme.textTheme.headlineLarge,
            ),
          )
        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        onButtonPressed: (index) {
          final tabSet = HomeTab.values.elementAt(index);

          context.read<HomeCubit>().setTab(tabSet);
        },
        backgroundColor: theme.colorScheme.secondary,
        iconSize: 30,
        activeColor: selectedTab.index.isEven
            ? theme.canvasColor
            : theme.colorScheme.inversePrimary,
        selectedIndex: selectedTab.index,
        barItems: [
          BarItem(
            icon: Icons.dashboard_rounded,
            title: 'Activities',
          ),
          BarItem(
            icon: Icons.local_activity_rounded,
            title: 'Stamps',
          ),
        ],
      ),
    );
  }
}
