
String formatDateTimeForTicket(DateTime dateTime) {
  final List<String> weekdays = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  String formattedDate =
      "${weekdays[dateTime.weekday - 1]}, " // Subtract 1 to get 0-based index
      "${months[dateTime.month - 1]} ${dateTime.day}, ${dateTime.year}";

  return formattedDate;
}