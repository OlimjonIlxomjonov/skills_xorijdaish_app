import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/file_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_file/file_state.dart';

class FileBloc extends Bloc<CoursesEvent, FileState> {
  final FileUseCase useCase;

  FileBloc(this.useCase) : super(FileInitial()) {
    on<FileEvent>((event, emit) async {
      emit(FileLoading());
      try {
        final response = await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonsId,
        );
        emit(FileLoaded(response));
      } catch (e) {
        emit(FileError(e.toString()));
      }
    });
  }
}
