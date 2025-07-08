import 'package:skills_xorijdaish/features/profile/domain/entity/self_profile_entity.dart';

class SelfInfoState {
  SelfInfoState();
}

class SelfInfoInitial extends SelfInfoState {}

class SelfInfoLoading extends SelfInfoState {}

class SelfInfoLoaded extends SelfInfoState {
  final SelfProfileEntity entity;

  SelfInfoLoaded(this.entity);
}

class SelfInfoError extends SelfInfoState {
  final String message;

  SelfInfoError(this.message);
}
