import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/configs/cache/app_session_cache.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/lesson_test_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/lesson_test_state.dart';

class LessonTestBloc extends Bloc<CoursesEvent, LessonTestState> {
  final LessonTestUseCase useCase;

  LessonTestBloc(this.useCase) : super(LessonTestInitial()) {
    on<LessonTestEvent>((event, emit) async {
      // if (appSession.lessonTestsResponse != null) {
      //   emit(LessonTestLoaded(appSession.lessonTestsResponse!));
      //   return;
      // }
      emit(LessonTestLoading());
      try {
        final response = await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonId,
        );
        // appSession.lessonTestsResponse = response;
        emit(LessonTestLoaded(response));
      } catch (e) {
        emit(LessonTestError(e.toString()));
      }
    });
  }
}
