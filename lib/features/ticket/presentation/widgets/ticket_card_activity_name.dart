part of 'ticket_card.dart';

class TicketCardActivityName extends StatelessWidget {
  const TicketCardActivityName({super.key, required this.activityName});
  final String activityName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RotatedBox(
      quarterTurns: -1,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.colorScheme.inverseSurface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.elliptical(25, 50),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text(
          activityName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium
              ?.copyWith(color: theme.colorScheme.inversePrimary),
        ),
      ),
    );
  }
}
