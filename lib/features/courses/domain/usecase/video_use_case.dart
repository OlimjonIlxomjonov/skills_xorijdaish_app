import 'package:skills_xorijdaish/features/courses/domain/entities/get_video/video_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class VideoUseCase {
  final CoursesRepository repository;

  VideoUseCase(this.repository);

  Future<VideoEntity> call({required int courseId, required int lessonsId}) {
    return repository.fetchVideo(courseId: courseId, lessonsId: lessonsId);
  }
}
