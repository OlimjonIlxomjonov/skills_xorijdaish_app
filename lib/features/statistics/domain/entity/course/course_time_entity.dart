class CourseTimeEntity {
  final int id;
  final String title;
  final String? country;
  final String? countryLanguage;
  final int activeTimesInSeconds;
  final int progress;
  final String status;
  final String createdAt;
  final String activeTimesInHumanReadable;

  CourseTimeEntity({
    required this.id,
    required this.title,
    this.country,
    this.countryLanguage,
    required this.activeTimesInSeconds,
    required this.progress,
    required this.status,
    required this.createdAt,
    required this.activeTimesInHumanReadable,
  });


}