import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/home/domain/usecase/read_all_use_case.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/home_event.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/notifications/read_all/read_all_state.dart';

class ReadAllBloc extends Bloc<HomeEvent, RaedAllState> {
  final ReadAllUseCase useCase;

  ReadAllBloc(this.useCase) : super(RaedAllInitial()) {
    on((event, emit) async {
      emit(RaedAllLoading());
      try {
        await useCase.call();
        emit(RaedAllLoaded());
      } catch (e) {
        emit(RaedAllError(e.toString()));
      }
    });
  }
}
