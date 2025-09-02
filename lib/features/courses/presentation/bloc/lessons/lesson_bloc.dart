import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/configs/cache/app_session_cache.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/lessons_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lessons/lessons_state.dart';

class LessonsBloc extends Bloc<CoursesEvent, LessonsState> {
  final LessonsUseCase useCase;

  LessonsBloc(this.useCase) : super(LessonsInitial()) {
    on<LessonsEvent>((event, emit) async {
      // emit(LessonsLoading());
      try {
        final response = await useCase.call(
          courseId: event.courseId,
          page: event.page,
        );
        emit(LessonsLoaded(response));
      } catch (e) {
        emit(LessonsError(e.toString()));
      }
    });
  }
}
