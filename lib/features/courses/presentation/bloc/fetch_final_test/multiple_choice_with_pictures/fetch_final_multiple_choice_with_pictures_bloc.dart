import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/fetch_final_test/final_listen_n_complete_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/multiple_choice_with_pictures/fetch_final_multple_choice_with_pictures_state.dart';

class FetchFinalMultipleChoiceWithPicturesBloc
    extends Bloc<CoursesEvent, FetchFinalMultipleChoiceWithPicturesState> {
  final FinalTestsRespUseCase useCase;

  FetchFinalMultipleChoiceWithPicturesBloc(this.useCase)
    : super(FetchFinalMultipleChoiceWithPicturesInitial()) {
    on<FinalTestResponseEvent>((event, emit) async {
      emit(FetchFinalMultipleChoiceWithPicturesLoading());
      try {
        final response = await useCase.callMultipleChoiceWithPictures(
          courseId: event.courseId,
          questionId: event.questionId,
        );
        emit(FetchFinalMultipleChoiceWithPicturesLoaded(response));
      } catch (e) {
        emit(FetchFinalMultipleChoiceWithPicturesError(e.toString()));
      }
    });
  }
}
