import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/lesson_by_id_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_by_id/lesson_by_id_state.dart';

class LessonByIdBloc extends Bloc<CoursesEvent, LessonsByIdState> {
  final LessonsByIdUseCase useCase;

  LessonByIdBloc(this.useCase) : super(LessonsByIdInitial()) {
    on<LessonsByIdEvent>((event, emit) async {
      emit(LessonsByIdLoading());
      try {
        final entity = await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonId,
        );
        emit(LessonsByIdLoaded(entity));
      } catch (e) {
        emit(LessonsByIdError(e.toString()));
      }
    });
  }
}
