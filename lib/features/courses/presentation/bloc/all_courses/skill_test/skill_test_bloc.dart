import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/skill_test_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/skill_test/skill_test_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

class SkillTestBloc extends Bloc<CoursesEvent, SkillTestState> {
  final SkillTestUseCase useCase;

  SkillTestBloc(this.useCase) : super(SkillTestInitial()) {
    on<SkillTestEvent>((event, emit) async {
      emit(SkillTestLoading());
      try {
        final response = await useCase.call(query: event.query);
        emit(SkillTestLoaded(response));
      } catch (e) {
        emit(SkillTestError(e.toString()));
      }
    });
  }
}
