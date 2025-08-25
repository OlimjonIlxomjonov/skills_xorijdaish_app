import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/tests/finish_final_test_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

import 'finish_final_test_state.dart';

class FinishFinalTestBloc extends Bloc<CoursesEvent, FinishFinalTestState> {
  final FinishFinalTestUseCase useCase;

  FinishFinalTestBloc(this.useCase) : super(FinishFinalTestInitial()) {
    on<FinishFinalTestEvent>((event, emit) async {
      emit(FinishFinalTestLoading());
      try {
        final response = await useCase.call(courseId: event.courseId);
        emit(FinishFinalTestLoaded(response));
      } catch (e) {
        emit(FinishFinalTestError(e.toString()));
      }
    });
  }
}
