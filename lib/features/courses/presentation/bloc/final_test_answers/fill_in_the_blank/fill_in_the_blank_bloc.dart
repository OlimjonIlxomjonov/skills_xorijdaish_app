import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/ans_final_fill_in_the_blank_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/fill_in_the_blank/fill_in_the_blank_state.dart';

class FinalFillInTheBlankBloc extends Bloc<CoursesEvent, FillInTheBlankState> {
  final AnsFinalFillInTheBlankUseCase useCase;

  FinalFillInTheBlankBloc(this.useCase) : super(FillInTheBlankInitial()) {
    on<FinalFillInTheBlankEvent>((event, emit) async {
      emit(FillInTheBlankLoading());
      try {
        await useCase.call(
          courseId: event.courseId,
          questionId: event.questionId,
          testType: event.testType,
          answerIds: event.answerIds,
        );
        emit(FillInTheBlankLoaded());
      } catch (e) {
        emit(FillInTheBlankError(e.toString()));
      }
    });
  }
}
