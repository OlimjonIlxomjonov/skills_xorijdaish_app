import 'package:skills_xorijdaish/features/home/domain/entities/banners/banners_response.dart';

class BannersState {
  BannersState();
}

class BannersInitial extends BannersState {}

class BannersLoading extends BannersState {}

class BannersLoaded extends BannersState {
  final BannersResponse response;

  BannersLoaded(this.response);
}

class BannersError extends BannersState {
  final String message;

  BannersError(this.message);
}
