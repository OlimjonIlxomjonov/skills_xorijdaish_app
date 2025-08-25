import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/fetch_final_test/final_listen_n_complete_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/listen_n_select_pairs/fetch_final_listen_n_select_pairs_state.dart';

class FetchFinalListenNSelectPairsBloc
    extends Bloc<CoursesEvent, FetchFinalListenNSelectPairsState> {
  final FinalTestsRespUseCase useCase;

  FetchFinalListenNSelectPairsBloc(this.useCase)
    : super(FetchFinalListenNSelectPairsInitial()) {
    on<FinalTestResponseEvent>((event, emit) async {
      emit(FetchFinalListenNSelectPairsLoading());
      try {
        final entity = await useCase.callListenNSelectPairs(
          courseId: event.courseId,
          questionId: event.questionId,
        );
        emit(FetchFinalListenNSelectPairsLoaded(entity));
      } catch (e) {
        emit(FetchFinalListenNSelectPairsError(e.toString()));
      }
    });
  }
}
