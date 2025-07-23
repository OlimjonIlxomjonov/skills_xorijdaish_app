import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/profile/domain/usecase/certificate_use_case.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/certificate/certificate_state.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';

class CertificateBloc extends Bloc<ProfileEvent, CertificateState> {
  final CertificateUseCase useCase;

  CertificateBloc(this.useCase) : super(CertificateInitial()) {
    on<CertificateEvent>((event, emit) async {
      emit(CertificateLoading());
      try {
        final response = await useCase.call();
        emit(CertificateLoaded(response));
      } catch (e) {
        emit(CertificateError(e.toString()));
      }
    });
  }
}
