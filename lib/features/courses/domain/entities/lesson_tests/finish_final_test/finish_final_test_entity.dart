class FinishFinalTestEntity {
  final int all;
  final int userAnswers;
  final int skipped;
  final int corrects;
  final int incorrects;
  final int time;
  final String certificateUrl;
  final double percent;
  final String timeForHumans;

  FinishFinalTestEntity({
    required this.all,
    required this.userAnswers,
    required this.skipped,
    required this.corrects,
    required this.incorrects,
    required this.time,
    required this.certificateUrl,
    required this.percent,
    required this.timeForHumans,
  });
}
