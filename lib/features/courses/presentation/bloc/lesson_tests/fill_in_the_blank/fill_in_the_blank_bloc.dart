import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/fill_in_the_blank_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/fill_in_the_blank/fill_in_the_blank_state.dart';

class FillInTheBlankBloc extends Bloc<CoursesEvent, FillInTheBlankStat> {
  final FillInTheBlankUseCase useCase;

  FillInTheBlankBloc(this.useCase) : super(FillInTheBlankInitial()) {
    on<FillInTheBlankEvent>((event, emit) async {
      emit(FillInTheBlankLoading());
      try {
        final entity = await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonId,
          questionId: event.questionId,
        );
        emit(FillInTheBlankLoaded(entity));
      } catch (e) {
        emit(FillInTheBlankError(e.toString()));
      }
    });
  }
}
