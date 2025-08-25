import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/final_test_by_id_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/lesson_tests/final_test_by_id/final_test_by_id_state.dart';

class FinalTestByIdBloc extends Bloc<CoursesEvent, FinalTestByIdState> {
  final FinalTestByIdUseCase useCase;

  FinalTestByIdBloc(this.useCase) : super(FinalTestByIdInitial()) {
    on<FinalTestByIdEvent>((event, emit) async {
      emit(FinalTestByIdLoading());
      try {
        final response = await useCase.call(
          courseId: event.courseId,
          questionId: event.questionId,
        );
        emit(FinalTestByIdLoaded(response));
      } catch (e) {
        emit(FinalTestByIdError(e.toString()));
      }
    });
  }
}
