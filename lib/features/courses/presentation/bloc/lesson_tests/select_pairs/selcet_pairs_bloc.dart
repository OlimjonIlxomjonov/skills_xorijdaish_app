import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/select_pairs_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/select_pairs/select_pairs_state.dart';

class SelectPairsBloc extends Bloc<CoursesEvent, SelectPairsState> {
  final SelectPairsUseCase useCase;

  SelectPairsBloc(this.useCase) : super(SelectPairsInitial()) {
    on<SelectPairsEvent>((event, emit) async {
      emit(SelectPairsLoading());
      try {
        final response = await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonId,
          questionId: event.questionId,
        );
        emit(SelectPairsLoaded(response));
      } catch (e) {
        emit(SelectPairsError(e.toString()));
      }
    });
  }
}
