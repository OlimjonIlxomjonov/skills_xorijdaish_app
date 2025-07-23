class WeekEntity {
  final String date;
  final int activeTimesInSeconds;
  final int weekday;
  final String activeTimesInHumanReadable;

  WeekEntity({
    required this.date,
    required this.activeTimesInSeconds,
    required this.weekday,
    required this.activeTimesInHumanReadable,
  });
}
