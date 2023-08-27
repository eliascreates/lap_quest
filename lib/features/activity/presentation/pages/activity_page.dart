import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_quest/features/activity/domain/entities/activity.dart';

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
        create: (context) => ActivityBloc(),
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
        ActivityCard(
          activity: ActivityEntity()..name = "Morning Routine",
          isFavorite: true,
        ),
      ],
    );
  }
}
