import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/configs/cache/app_session_cache.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/soft_skills_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/soft_skills/soft_skills_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

class SoftSkillsBloc extends Bloc<CoursesEvent, SoftSkillsState> {
  final SoftSkillsUseCase useCase;

  SoftSkillsBloc(this.useCase) : super(SoftSkillsInitial()) {
    on<GetSoftSkillsEvent>((event, emit) async {
      // emit(SoftSkillsLoading());
      // if (appSession.softSkillsInfo != null) {
      //   emit(SoftSkillsLoaded(appSession.softSkillsInfo!));
      // }
      try {
        final result = await useCase.call(query: event.query);
        // appSession.softSkillsInfo = result;
        emit(SoftSkillsLoaded(result));
      } catch (e) {
        emit(SoftSkillsError(e.toString()));
      }
    });
  }
}
