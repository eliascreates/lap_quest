String formatDuration(Duration duration, {bool showAllDigits = false}) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");

  int hours = duration.inHours;
  int minutes = duration.inMinutes.remainder(60);
  int seconds = duration.inSeconds.remainder(60);
  String oneDigitMilliseconds =
      (duration.inMilliseconds.remainder(1000) ~/ 100).toString();

  if (showAllDigits || hours > 0) {
    return "${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}.$oneDigitMilliseconds";
  }
  return "${twoDigits(minutes)}:${twoDigits(seconds)}.$oneDigitMilliseconds";
}
