import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/face_recognation/face_recognation_compare_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/face_recognation/face_recognition_my_id/face_rec_my_id_state.dart';

class FaceRecognitionCompareBloc extends Bloc<CoursesEvent, FaceRecMyIdState> {
  final FaceRecognitionCompareUseCase useCase;

  FaceRecognitionCompareBloc(this.useCase) : super(FaceRecMyIdInitial()) {
    on<FaceRecognitionCompareEvent>((event, emit) async {
      emit(FaceRecMyIdLoading());
      try {
        await useCase.call(image: event.image);
        emit(FaceRecMyIdLoaded());
      } catch (e) {
        emit(FaceRecMyIdError(e.toString()));
      }
    });
  }
}
