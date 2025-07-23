import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/video_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_video/video_state.dart';

class VideoBloc extends Bloc<CoursesEvent, VideoState> {
  final VideoUseCase useCase;

  VideoBloc(this.useCase) : super(VideoInitial()) {
    on<VideoEvent>((event, emit) async {
      emit(VideoLoading());
      try {
        final entity = await useCase.call(
          courseId: event.courseId,
          lessonsId: event.lessonsId,
        );
        emit(VideoLoaded(entity));
      } catch (e) {
        emit(VideoError(e.toString()));
      }
    });
  }
}
