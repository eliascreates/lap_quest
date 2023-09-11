part of 'ticket_card.dart';

enum CirclesPosition { topCorners, center, bottomCorners }

class TicketCardCircleCuts extends StatelessWidget {
  const TicketCardCircleCuts({
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
