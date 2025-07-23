class ReelsEvent {
  ReelsEvent();
}

class GetReelsEvent extends ReelsEvent {}

class LikeEvent extends ReelsEvent {
  final int reelsId;

  LikeEvent(this.reelsId);
}
