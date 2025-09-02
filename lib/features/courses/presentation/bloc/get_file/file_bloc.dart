import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/core/configs/cache/app_session_cache.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/file_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/get_file/file_state.dart';

class FileBloc extends Bloc<CoursesEvent, FileState> {
  final FileUseCase useCase;

  FileBloc(this.useCase) : super(FileInitial()) {
    on<FileEvent>((event, emit) async {
      // if (appSession.fileResponse != null) {
      //   emit(FileLoaded(appSession.fileResponse!));
      //   return;
      // }
      emit(FileLoading());
      try {
        final response = await useCase.call(
          courseId: event.courseId,
          lessonId: event.lessonsId,
        );
        // appSession.fileResponse = response;
        emit(FileLoaded(response));
      } catch (e) {
        emit(FileError(e.toString()));
      }
    });
  }
}
