import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/final_test/ans_final_select_pairs_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/final_test_answers/select_pairs/final_select_pairs_state.dart';

class FinalSelectPairsBloc extends Bloc<CoursesEvent, FinalSelectPairsState> {
  final AnsFinalSelectPairsUseCase useCase;

  FinalSelectPairsBloc(this.useCase) : super(FinalSelectPairsInitial()) {
    on<FinalSelectPairsEvent>((event, emit) async {
      emit(FinalSelectPairsLoading());

      try {
        await useCase.call(
          courseId: event.courseId,
          questionId: event.questionId,
          answerId: event.answerId,
          testType: event.testType,
          pairText: event.pairText,
        );
        emit(FinalSelectPairsLoaded());
      } catch (e) {
        emit(FinalSelectPairsError(e.toString()));
      }
    });
  }
}
