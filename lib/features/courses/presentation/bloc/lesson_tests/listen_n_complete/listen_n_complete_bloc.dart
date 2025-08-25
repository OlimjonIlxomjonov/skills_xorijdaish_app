import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/listen_n_complate_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/listen_n_complete/listen_n_complete_state.dart';

class ListenNCompleteBloc extends Bloc<CoursesEvent, ListenNCompleteState> {
  final ListenNCompleteUseCase useCase;

  ListenNCompleteBloc(this.useCase) : super(ListenNCompleteInitial()) {
    on<ListenNCompleteEvent>((event, emit) async {
      emit(ListenNCompleteLoading());
      try {
        final response = await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonId,
          questionId: event.questionId,
        );
        emit(ListenNCompleteLoaded(response));
      } catch (e) {
        emit(ListenNCompleteError(e.toString()));
      }
    });
  }
}
