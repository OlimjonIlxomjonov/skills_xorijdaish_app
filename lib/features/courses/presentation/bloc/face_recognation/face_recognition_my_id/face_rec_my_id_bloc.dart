import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/face_recognation/face_recognition_my_id_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

import 'face_rec_my_id_state.dart';

class FaceRecMyIdBloc extends Bloc<CoursesEvent, FaceRecMyIdState> {
  final FaceRecognitionMyIdUseCase useCase;

  FaceRecMyIdBloc(this.useCase) : super(FaceRecMyIdInitial()) {
    on<FaceRecMyIdEvent>((event, emit) async {
      emit(FaceRecMyIdLoading());
      try {
        await useCase.call(code: event.code, image: event.image);
        emit(FaceRecMyIdLoaded());
      } catch (e) {
        emit(FaceRecMyIdError(e.toString()));
      }
    });
  }
}
