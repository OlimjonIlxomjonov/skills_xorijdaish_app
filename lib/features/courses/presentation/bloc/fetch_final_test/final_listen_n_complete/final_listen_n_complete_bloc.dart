import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/final_listen_n_complete/final_listen_n_complete_state.dart';

import '../../../../domain/usecase/final_test/fetch_final_test/final_listen_n_complete_use_case.dart';

class FetchFinalListenNCompleteBloc
    extends Bloc<CoursesEvent, FetchFinalListenNCompleteState> {
  final FinalTestsRespUseCase useCase;

  FetchFinalListenNCompleteBloc(this.useCase)
    : super(FinalListenNCompleteInitial()) {
    on<FinalTestResponseEvent>((event, emit) async {
      emit(FinalListenNCompleteLoading());
      try {
        final response = await useCase.callListenNComplete(
          courseId: event.courseId,
          questionId: event.questionId,
        );
        emit(FinalListenNCompleteLoaded(response));
      } catch (e) {
        emit(FinalListenNCompleteError(e.toString()));
      }
    });
  }
}
