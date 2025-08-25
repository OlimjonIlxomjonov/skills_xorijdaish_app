import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/download_image.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/download_image/download_image_state.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';

class DownloadImageBloc extends Bloc<ProfileEvent, DownloadImageState> {
  final DownloadImageUseCase useCase;

  DownloadImageBloc(this.useCase) : super(DownloadImageInitial()) {
    on<DownloadImageEvent>((event, emit) async {
      emit(DownloadImageLoading());
      try {
        await useCase.call(ticketId: event.ticketId, fileId: event.fileId);
        emit(DownloadImageLoaded());
      } catch (e) {
        emit(DownloadImageError(e.toString()));
      }
    });
  }
}
