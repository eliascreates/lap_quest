import 'package:flutter/material.dart';

import 'package:lap_quest/core/constants/constants.dart';
import 'package:lap_quest/features/activity/activity.dart';

part 'ticket_card_activity_name.dart';
part 'ticket_card_bottom_content.dart';
part 'ticket_card_circle_cuts.dart';
part 'ticket_card_top_content.dart';

class TicketCard extends StatelessWidget {
  final String activityName;
  final String rank;
  final Color color;
  final Lap lap;
  final bool showTag;

  const TicketCard({
    super.key,
    required this.activityName,
    required this.rank,
    required this.color,
    required this.lap,
    required this.showTag,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showTag) TicketCardActivityName(activityName: activityName),
        SizedBox(
          width: 250,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TicketCardTopContent(color: color, lap: lap, rank: rank),
                  TicketCardBottomContent(color: color, lap: lap),
                ],
              ),
              TicketCardCircleCuts(
                circlesPosition: CirclesPosition.topCorners,
                showTag: showTag,
              ),
              TicketCardCircleCuts(
                circlesPosition: CirclesPosition.center,
                showTag: showTag,
              ),
              TicketCardCircleCuts(
                circlesPosition: CirclesPosition.bottomCorners,
                showTag: showTag,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
