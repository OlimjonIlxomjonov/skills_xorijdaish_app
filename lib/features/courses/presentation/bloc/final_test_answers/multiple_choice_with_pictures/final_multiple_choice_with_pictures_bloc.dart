import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/ans_final_multiple_choice_with_pictures_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/multiple_choice_with_pictures/final_multiple_choice_with_pictures_state.dart';

class FinalMultipleChoiceWithPicturesBloc
    extends Bloc<CoursesEvent, FinalMultipleChoiceWithPicturesState> {
  final AnsFinalMultipleChoiceWithPicturesUseCase useCase;

  FinalMultipleChoiceWithPicturesBloc(this.useCase)
    : super(FinalMultipleChoiceWithPicturesInitial()) {
    on<FinalMultipleChoiceWithPicturesEvent>((event, emit) async {
      emit(FinalMultipleChoiceWithPicturesLoading());
      try {
        await useCase.call(
          courseId: event.courseId,
          questionId: event.questionId,
          answerId: event.answerId,
          testType: event.testType,
        );
        emit(FinalMultipleChoiceWithPicturesLoaded());
      } catch (e) {
        emit(FinalMultipleChoiceWithPicturesError(e.toString()));
      }
    });
  }
}
