import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/fetch_final_test/final_listen_n_complete_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/filil_in_the_blank/fetch_final_fill_in_the_blank_state.dart';

class FetchFinalFillInTheBlankBloc
    extends Bloc<CoursesEvent, FetchFinalFillInTheBlankState> {
  final FinalTestsRespUseCase useCase;

  FetchFinalFillInTheBlankBloc(this.useCase)
    : super(FetchFinalFillInTheBlankInitial()) {
    on<FinalTestResponseEvent>((event, emit) async {
      emit(FetchFinalFillInTheBlankLoading());
      try {
        final response = await useCase.callFillInTheBlank(
          courseId: event.courseId,
          questionId: event.questionId,
        );
        emit(FetchFinalFillInTheBlankLoaded(response));
      } catch (e) {
        emit(FetchFinalFillInTheBlankError(e.toString()));
      }
    });
  }
}
