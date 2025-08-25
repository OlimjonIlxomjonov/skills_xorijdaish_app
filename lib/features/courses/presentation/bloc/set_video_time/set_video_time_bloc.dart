import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/set_video_time_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/set_video_time/set_video_time_state.dart';

class SetVideoTimeBloc extends Bloc<CoursesEvent, SetVideoTimeState> {
  final SetVideoTimeUseCase useCase;

  SetVideoTimeBloc(this.useCase) : super(SetVideoTimeInitial()) {
    on<SetVideoTimeEvent>((event, emit) async {
      emit(SetVideoTimeLoading());
      try {
        await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonId,
          time: event.time,
          isWatched: event.isWatched,
        );
        emit(SetVideoTimeLoaded(event.isWatched));
      } catch (e) {
        emit(SetVideoTimeError(e.toString()));
      }
    });
  }
}
