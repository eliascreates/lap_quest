part of 'ticket_card.dart';

class TicketCardTopContent extends StatelessWidget {
  const TicketCardTopContent({
    super.key,
    required this.color,
    required this.lap,
    required this.rank,
  });

  final Color color;
  final Lap lap;
  final String rank;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Color.lerp(color, theme.primaryColor, 0.5),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Lap #${lap.id}',
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(rank,
              style: theme.textTheme.titleSmall?.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
