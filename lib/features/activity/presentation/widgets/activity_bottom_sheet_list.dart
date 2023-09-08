import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lap_quest/features/activity/domain/entities/activity.dart';

import '../bloc/activity_bloc.dart';
import 'activity_name_dialog.dart';

class ActivityBottomSheetList extends StatelessWidget {
  const ActivityBottomSheetList({super.key, required this.activity});

  final ActivityEntity activity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ActivityBottomSheetTile(
          onTap: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ActivityNameDialog(activity: activity);
              },
            );
          },
          activity: activity,
          text: "Edit",
          icon: Icons.edit_outlined,
        ),
        ActivityBottomSheetTile(
          onTap: () {
            Navigator.pop(context);
            context.read<ActivityBloc>().add(
                  ActivityDeleted(activityId: activity.id),
                );
          },
          activity: activity,
          text: "Delete",
          icon: Icons.delete_outline,
        ),
      ],
    );
  }
}

class ActivityBottomSheetTile extends StatelessWidget {
  const ActivityBottomSheetTile({
    super.key,
    required this.activity,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final ActivityEntity activity;
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: onTap,
      leading: Icon(icon, size: 30),
      title: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      textColor: theme.canvasColor,
      iconColor: theme.canvasColor,
      shape: BorderDirectional(
        bottom: BorderSide(
          width: 1,
          color: theme.canvasColor.withOpacity(0.1),
        ),
      ),
    );
  }
}
