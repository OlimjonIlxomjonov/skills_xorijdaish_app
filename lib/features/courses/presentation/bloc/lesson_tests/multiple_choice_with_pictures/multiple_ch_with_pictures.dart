import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/multiple_choice_with_pictures_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/multiple_choice_with_pictures/multiple_ch_with_pictures_state.dart';

class MultipleChoiceWithPicturesBloc
    extends Bloc<CoursesEvent, MultipleChoiceWithPicturesState> {
  final MultipleChoiceWithPicturesUseCase useCase;

  MultipleChoiceWithPicturesBloc(this.useCase)
    : super(MultipleChoiceWithPicturesInitial()) {
    on<MultipleChoiceWithPicturesEvent>((event, emit) async {
      emit(MultipleChoiceWithPicturesLoading());

      try {
        final entity = await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonId,
          questionId: event.questionId,
        );
        emit(MultipleChoiceWithPicturesLoaded(entity));
      } catch (e) {
        emit(MultipleChoiceWithPicturesError(e.toString()));
      }
    });
  }
}
