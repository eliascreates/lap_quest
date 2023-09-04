import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_quest/features/activity/domain/entities/activity.dart';

import '../bloc/activity_bloc.dart';
import 'activity_name_dialog.dart';

class ActivityBottomSheet extends StatelessWidget {
  const ActivityBottomSheet({super.key, required this.activity});

  final ActivityEntity activity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Edit'),
          onTap: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ActivityNameDialog(activity: activity);
              },
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.delete),
          title: const Text('Delete'),
          onTap: () {
            Navigator.pop(context);
            context
                .read<ActivityBloc>()
                .add(ActivityDeleted(activityId: activity.id));
          },
        ),
      ],
    );
  }
}
