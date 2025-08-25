import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/buy_course/buy_course_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/buy_course/buy_course_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

class BuyCourseBloc extends Bloc<CoursesEvent, BuyCourseState> {
  final BuyCourseUseCase useCase;

  BuyCourseBloc(this.useCase) : super(BuyCourseInitial()) {
    on<BuyCourseEvent>((event, emit) async {
      emit(BuyCourseLoading());
      try {
        final entity = await useCase.call(courseId: event.courseId);
        emit(BuyCourseLoaded(entity));
      } catch (e) {
        emit(BuyCourseError(e.toString()));
      }
    });
  }
}
