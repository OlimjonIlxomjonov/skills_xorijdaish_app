import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/reels/domain/usecase/reels_use_case.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/get_reels/reels_state.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/reels_event.dart';

class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  final ReelsUseCase useCase;

  ReelsBloc(this.useCase) : super(ReelsInitial()) {
    on<GetReelsEvent>((event, emit) async {
      emit(ReelsLoading());
      try {
        final response = await useCase.call();
        emit(ReelsLoaded(response));
      } catch (e) {
        emit(ReelsError(e.toString()));
      }
    });
  }
}
