import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/home/domain/usecase/read_one_use_case.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/home_event.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/notifications/read_one/read_one_state.dart';

class ReadOneBloc extends Bloc<HomeEvent, ReadOneState> {
  final ReadOneUseCase useCase;

  ReadOneBloc(this.useCase) : super(ReadOneInitial()) {
    on<ReadOneEvent>((event, emit) async {
      try {
        await useCase.call(id: event.id);
        emit(ReadOneLoaded());
      } catch (e) {
        emit(ReadOneError(e.toString()));
      }
    });
  }
}
