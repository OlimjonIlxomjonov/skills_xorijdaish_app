class FinishTestEntity {
  final int all;
  final int userAnswers;
  final int skipped;
  final int corrects;
  final int incorrects;
  final int time;
  final int? nextLessonId;
  final double percent;
  final int stars;
  final String timeForHumans;

  FinishTestEntity({
    required this.all,
    required this.userAnswers,
    required this.skipped,
    required this.corrects,
    required this.incorrects,
    required this.time,
    required this.nextLessonId,
    required this.percent,
    required this.stars,
    required this.timeForHumans,
  });
}
