import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/listen_n_select_pairs_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/listen_n_selet_pairs/listen_n_select_pairs_state.dart';

class ListenNSelectPairsBloc
    extends Bloc<CoursesEvent, ListenNSelectPairsState> {
  final ListenNSelectPairsUseCase useCase;

  ListenNSelectPairsBloc(this.useCase) : super(ListenNSelectPairsLoading()) {
    on<ListenNSelectPairsEvent>((event, emit) async {
      emit(ListenNSelectPairsLoading());
      try {
        final entity = await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonId,
          questionId: event.questionId,
        );
        emit(ListenNSelectPairsLoaded(entity));
      } catch (e) {
        emit(ListenNSelectPairsError(e.toString()));
      }
    });
  }
}
