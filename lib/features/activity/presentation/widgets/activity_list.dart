import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_quest/core/widgets/empty_content.dart';

import '../bloc/activity_bloc.dart';
import 'activity_card.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    final activities =
        context.select((ActivityBloc bloc) => bloc.state.activities);

    if (activities.isEmpty) {
      return const EmptyContent(
        message: 'You do not have any activities.',
        instruction: 'Tap the plus + icon to create an activity.',
      );
    }

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
