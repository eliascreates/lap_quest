import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lap_quest/features/activity/domain/entities/activity.dart';

import '../bloc/activity_bloc.dart';

class ActivityNameDialog extends StatefulWidget {
  final ActivityEntity? activity;

  const ActivityNameDialog({super.key, this.activity});

  @override
  State<ActivityNameDialog> createState() => _ActivityNameDialogState();
}

class _ActivityNameDialogState extends State<ActivityNameDialog> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasActivity = widget.activity != null;

    if (hasActivity) {
      _nameController.text = widget.activity?.name ?? '';
    }

    return AlertDialog(
      title: Text(hasActivity ? 'Edit Activity Name' : 'Enter Activity Name'),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: TextField(
        controller: _nameController,
        decoration: InputDecoration(
          labelText: 'Activity Name',
          helperText: hasActivity
              ? null
              : 'e.g - ${activityExamples[Random().nextInt(activityExamples.length)]}',
        ),
        maxLength: 50,
        inputFormatters: [
          LengthLimitingTextInputFormatter(50),
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]')),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: hasActivity ? editActivity : createActivity,
          child: const Text('Save'),
        ),
      ],
    );
  }

  void editActivity() {
    final name = _nameController.text;
    final activity = widget.activity!;

    if (name.isNotEmpty) {
      context
          .read<ActivityBloc>()
          .add(ActivityUpdated(activityId: activity.id, name: name));
    }
    Navigator.of(context).pop();
  }

  void createActivity() {
    final name = _nameController.text;
    if (name.isNotEmpty) {
      context.read<ActivityBloc>().add(ActivityCreated(name: name));
    }

    Navigator.of(context).pop();
  }

  List<String> activityExamples = [
    'morning routine',
    'workout routine',
    'ironing clothes',
    'cutting grass',
    'spring cleaning',
    'jogging',
    'cooking',
  ];
}
