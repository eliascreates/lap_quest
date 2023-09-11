part of 'ticket_card.dart';

class TicketCardBottomContent extends StatelessWidget {
  const TicketCardBottomContent({
    super.key,
    required this.color,
    required this.lap,
  });

  final Color color;
  final Lap lap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      color: color,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                (MediaQuery.sizeOf(context).width / 20).floor(),
                (index) => Container(width: 5, height: 1, color: Colors.white),
              ),
            ),
          ),
          Text(
            formatDuration(lap.lapDuration),
            style: theme.textTheme.titleMedium
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            formatDateTimeForTicket(lap.timestamp!),
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}