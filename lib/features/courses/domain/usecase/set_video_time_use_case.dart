import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class SetVideoTimeUseCase {
  final CoursesRepository repository;

  SetVideoTimeUseCase(this.repository);

  Future<void> call({
    required int courseId,
    required int lessonId,
    required int time,
    required bool isWatched,
  }) {
    return repository.setVideoTime(
      courseId: courseId,
      lessonId: lessonId,
      time: time,
      isWatched: isWatched,
    );
  }
}
