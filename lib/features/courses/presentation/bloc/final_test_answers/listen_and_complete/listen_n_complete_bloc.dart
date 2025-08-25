import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/ans_final_listen_n_complete_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/listen_and_complete/listen_n_comlpete_state.dart';

class FinalListenNCompleteBloc
    extends Bloc<CoursesEvent, ListenNCompleteState> {
  final AnsFinalListenNComplete useCase;

  FinalListenNCompleteBloc(this.useCase) : super(ListenNCompleteInitial()) {
    on<FinalListenNCompleteEvent>((event, emit) async {
      emit(ListenNCompleteLoading());
      try {
        await useCase.call(
          courseId: event.courseId,
          questionId: event.questionId,
          testType: event.testType,
          answer: event.answer,
        );
        emit(ListenNCompleteLoaded());
      } catch (e) {
        emit(ListenNCompleteError(e.toString()));
      }
    });
  }
}
