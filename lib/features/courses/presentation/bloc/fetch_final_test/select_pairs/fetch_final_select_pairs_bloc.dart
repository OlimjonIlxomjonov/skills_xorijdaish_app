import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/fetch_final_test/final_listen_n_complete_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/fetch_final_test/select_pairs/fetch_final_select_pairs_state.dart';

class FetchFinalSelectPairsBloc
    extends Bloc<CoursesEvent, FetchFinalSelectPairsState> {
  final FinalTestsRespUseCase useCase;

  FetchFinalSelectPairsBloc(this.useCase)
    : super(FetchFinalSelectPairsInitial()) {
    on<FinalTestResponseEvent>((event, emit) async {
      emit(FetchFinalSelectPairsLoading());
      try {
        final response = await useCase.callSelectPairs(
          courseId: event.courseId,
          questionId: event.questionId,
        );
        emit(FetchFinalSelectPairsLoaded(response));
      } catch (e) {
        emit(FetchFinalSelectPairsError(e.toString()));
      }
    });
  }
}
