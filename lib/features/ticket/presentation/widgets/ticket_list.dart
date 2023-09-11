import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lap_quest/core/widgets/widgets.dart';
import 'package:lap_quest/features/activity/activity.dart';

import 'ticket_card.dart';

class TicketList extends StatelessWidget {
  const TicketList({super.key});

  @override
  Widget build(BuildContext context) {
    final acts = context
        .select((ActivityBloc bloc) => bloc.state.activities)
        .where((element) => element.isFavorite)
        .toList();

    final List<ActivityEntity> activities =
        acts.every((act) => act.laps.isEmpty) ? [] : acts;

    activities.sort((a, b) => b.laps.length.compareTo(a.laps.length));

    if (activities.isEmpty) {
      return const SliverFillRemaining(
        child: EmptyContent(
          message: 'You do not have any activities with related tickets.',
          instruction:
              'Tap the ticket icon to generate tickets for your activities.',
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final activity = activities[index];

          return activity.laps.isNotEmpty
              ? Container(
                  height: 152,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: activity.laps.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final laps = activity.laps;
                      final lap = laps[index];

                      return TicketCard(
                        activityName: activity.name,
                        rank: activity.rankLap(lap),
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                        lap: lap,
                        showTag: index == 0,
                      );
                    },
                  ),
                )
              : const SizedBox.shrink();
        },
        childCount: activities.length,
      ),
    );
  }
}
