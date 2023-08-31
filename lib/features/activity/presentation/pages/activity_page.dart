import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_quest/features/activity/domain/usecases/domain_usecases.dart';
import 'package:lap_quest/service_locator.dart';

import '../bloc/activity_bloc.dart';
import '../widgets/activity_card.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body: BlocProvider(
        create: (context) => ActivityBloc(
          getAllActivities: sl<GetAllActivities>(),
          createActivity: sl<CreateActivity>(),
          deleteActivity: sl<DeleteActivity>(),
          updateActivity: sl<UpdateActivity>(),
        ),
        child: const ActivityView(),
      ),
    );
  }
}

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(height: 20),
        const Expanded(
          child: AnimatedActivityList(),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () => context.read<ActivityBloc>().add(
                    ActivityCreated(name: Random().nextInt(10).toString()),
                  ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedActivityList extends StatelessWidget {
  const AnimatedActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    final activities =
        context.select((ActivityBloc bloc) => bloc.state.activities);

    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final currentActivity = activities[index];
        return ActivityCard(
          activity: currentActivity,
          isFavorite: currentActivity.isFavorite,
        );
      },
    );
  }
}
