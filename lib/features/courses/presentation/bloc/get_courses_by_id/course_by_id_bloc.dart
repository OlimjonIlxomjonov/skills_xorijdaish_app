import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/course_by_id_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_courses_by_id/course_by_id_state.dart';

class CourseByIdBloc extends Bloc<CoursesEvent, CourseByIdState> {
  final CourseByIdUseCase useCase;

  CourseByIdBloc(this.useCase) : super(CourseByIdInitial()) {
    on<CourseByIdEvent>((event, emit) async {
      emit(CourseByIdLoading());
      try {
        final response = await useCase.call(courseId: event.courseId);
        emit(CourseByIdLoaded(response));
      } catch (e) {
        emit(CourseByIdError(e.toString()));
      }
    });
  }
}
