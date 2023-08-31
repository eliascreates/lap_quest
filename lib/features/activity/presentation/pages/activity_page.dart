import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_quest/features/activity/domain/entities/activity.dart';
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
    return Column(
      children: [
        const SizedBox(height: 20),
        Expanded(
          child: AnimatedActivityList(activities: [
            ActivityEntity()..name = "Morning Routine",
            ActivityEntity()..name = "Training Session",
            ActivityEntity()..name = "Ironing Clothes",
            ActivityEntity()..name = "Cutting grass",
          ]),
        )
      ],
    );
  }
}

class AnimatedActivityList extends StatefulWidget {
  const AnimatedActivityList({super.key, required this.activities});
  final List<ActivityEntity> activities;

  @override
  State<AnimatedActivityList> createState() => _AnimatedActivityListState();
}

class _AnimatedActivityListState extends State<AnimatedActivityList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<ActivityEntity> pushedActivities = [];

  @override
  void initState() {
    super.initState();
    animateInsertion();
  }

  Future<void> animateInsertion() async {
    for (var i = 0; i < widget.activities.length; i++) {
      await Future.delayed(const Duration(milliseconds: 125));
      pushedActivities.add(widget.activities[i]);
      _listKey.currentState?.insertItem(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: pushedActivities.length,
      itemBuilder: (context, index, animation) {
        final currentActivities = pushedActivities[index];
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: ActivityCard(
            activity: currentActivities,
            isFavorite: index % 2 == 0,
          ),
        );
      },
    );
  }
}
