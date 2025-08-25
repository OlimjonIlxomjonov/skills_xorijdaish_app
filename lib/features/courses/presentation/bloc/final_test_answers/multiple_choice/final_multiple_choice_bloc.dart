import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/answer_final_multiple_choice_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/multiple_choice/final_multiple_choice.dart';

class FinalMultipleChoiceBloc
    extends Bloc<CoursesEvent, FinalMultipleChoiceState> {
  final AnswerFinalMultipleChoiceUseCase useCase;

  FinalMultipleChoiceBloc(this.useCase) : super(FinalMultipleChoiceInitial()) {
    on<FinalMultipleChoiceEvent>((event, emit) async {
      emit(FinalMultipleChoiceLoading());
      try {
        await useCase.call(
          courseId: event.courseId,
          questionId: event.questionId,
          answerId: event.answerId,
          testType: event.testType,
        );
        emit(FinalMultipleChoiceLoaded());
      } catch (e) {
        emit(FinalMultipleChoiceError(e.toString()));
      }
    });
  }
}
