import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/faqs_use_case.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/faqs/faqs_state.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';

class FaqsBloc extends Bloc<ProfileEvent, FaqsState> {
  final FaqsUseCase useCase;

  FaqsBloc(this.useCase) : super(FaqsInitial()) {
    on<FaqsEvent>((event, emit) async {
      try {
        final response = await useCase.call();
        emit(FaqsLoaded(response));
      } catch (e) {
        emit(FaqsError(e.toString()));
      }
    });
  }
}
