import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_quest/core/constants/constants.dart';
import 'package:lap_quest/features/activity/activity.dart';
import 'package:lap_quest/features/theme/theme.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Tickets'),
        actions: const [ThemeToggleButton(), SizedBox(width: 10)],
      ),
      body: const TicketView(),
    );
  }
}

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activities = context
        .select((ActivityBloc bloc) => bloc.state.activities)
        .where((element) => element.isFavorite)
        .toList();

    return CustomScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        SliverToBoxAdapter(
          child: activities.isEmpty
              ? Center(
                  child: Text(
                    'Activity Tickets',
                    style: theme.textTheme.headlineLarge,
                  ),
                )
              : const SizedBox.shrink(),
        ),
        if (activities.isNotEmpty)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final activity = activities[index];

                return activity.laps.isNotEmpty
                    ? Container(
                        margin: const EdgeInsets.only(top: 42),
                        height: 200,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: activity.laps.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final laps = activity.laps;
                            final lap = laps[index];

                            final ticket = Ticket(
                              activityName: activity.name,
                              rank: activity.rankLap(lap),
                              color: Colors.primaries.reversed.elementAt(index),
                              lap: lap,
                            );

                            return TicketWidget(
                              ticket: ticket,
                              showTag: index == 0,
                            );
                          },
                        ),
                      )
                    : const SizedBox.shrink();
              },
              childCount: activities.length,
            ),
          ),
      ],
    );
  }
}

class Ticket {
  final String activityName;
  final String rank;
  final Color color;
  final Lap lap;

  Ticket(
      {required this.activityName,
      required this.rank,
      required this.color,
      required this.lap});
}

class TicketWidget extends StatelessWidget {
  final Ticket ticket;
  final bool showTag;
  const TicketWidget({super.key, required this.ticket, required this.showTag});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showTag)
                RotatedBox(
                  quarterTurns: -1,
                  child: Container(
                    width: 192,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.inverseSurface,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.elliptical(25, 50),
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      ticket.activityName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium
                          ?.copyWith(color: theme.colorScheme.inversePrimary),
                    ),
                  ),
                ),
              SizedBox(
                width: size.width * 0.85,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //* Top
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration:
                              BoxDecoration(color: ticket.color.withRed(200)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Lap #${ticket.lap.id}',
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(ticket.rank,
                                      style: theme.textTheme.titleSmall
                                          ?.copyWith(color: Colors.white)),
                                ],
                              )
                            ],
                          ),
                        ),
                        //* Bottom
                        Container(
                          color: ticket.color,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 5),
                              Row(children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        return Flex(
                                          direction: Axis.horizontal,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                            (constraints.constrainWidth() / 15)
                                                .floor(),
                                            (index) => const SizedBox(
                                              width: 5,
                                              height: 1,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: ticket.color,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          formatDuration(
                                              ticket.lap.lapDuration),
                                          style: theme.textTheme.titleMedium),
                                      const SizedBox(height: 10),
                                      Text('Lap Duration',
                                          style: theme.textTheme.titleSmall
                                              ?.copyWith(color: Colors.white)),
                                    ],
                                  ),
                                  Text(
                                      formatDateTimeForTicket(
                                        ticket.lap.timestamp!,
                                      ),
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(color: Colors.white)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    TicketCornerCircles(
                        circlesPosition: CirclesPosition.topCorners,
                        showTag: showTag),
                    TicketCornerCircles(
                      circlesPosition: CirclesPosition.center,
                      showTag: showTag,
                    ),
                    TicketCornerCircles(
                      circlesPosition: CirclesPosition.bottomCorners,
                      showTag: showTag,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum CirclesPosition { topCorners, center, bottomCorners }

class TicketCornerCircles extends StatelessWidget {
  const TicketCornerCircles({
    super.key,
    required this.circlesPosition,
    required this.showTag,
  });
  final bool showTag;
  final CirclesPosition circlesPosition;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned(
      left: -20,
      right: -20,
      top: circlesPosition != CirclesPosition.topCorners ? null : -20,
      bottom: circlesPosition != CirclesPosition.bottomCorners ? null : -20,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox.square(
          dimension: 40,
          child: Container(
            decoration: BoxDecoration(
              color: showTag
                  ? theme.colorScheme.inverseSurface
                  : theme.canvasColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox.square(
          dimension: 40,
          child: Container(
            decoration: BoxDecoration(
              color: theme.canvasColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ]),
    );
  }
}
