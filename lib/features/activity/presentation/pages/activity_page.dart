import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/activity_bloc.dart';
import '../widgets/widgets.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body: const ActivityView(),
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
          child: ActivityList(),
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

