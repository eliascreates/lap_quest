part of 'activity_card.dart';

class ActivityLapInfo extends StatelessWidget {
  const ActivityLapInfo({
    super.key,
    required this.label,
    required this.lapTime,
  });

  final String label;
  final Duration lapTime;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final captionColor = textTheme.bodySmall?.color;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4.0),
        Row(
          children: [
            Icon(Icons.timer_outlined, color: captionColor),
            const SizedBox(width: 6.0),
            Text(
              formatDuration(lapTime),
              style: TextStyle(color: captionColor),
            ),
          ],
        ),
      ],
    );
  }
}
