import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/put_like/like_state.dart';
import 'package:skills_xorijdaish/features/reels/presentation/bloc/reels_event.dart';

import '../../../domain/usecase/post_reels_like.dart';

class LikeBloc extends Bloc<ReelsEvent, LikeState> {
  final PostReelsLikeUseCase useCase;

  LikeBloc(this.useCase) : super(LikeInitial()) {
    on<LikeEvent>((event, emit) async {
      emit(LikeLoading());
      try {
        await useCase.call(reelId: event.reelsId);
        emit(LikeLoaded());
      } catch (e) {
        emit(LikeError(e.toString()));
      }
    });
  }
}
