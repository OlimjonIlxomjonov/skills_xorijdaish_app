class ReelsEvent {
  ReelsEvent();
}

class GetReelsEvent extends ReelsEvent {
  final int page;

  GetReelsEvent({this.page = 1});
}

class LikeEvent extends ReelsEvent {
  final int reelsId;

  LikeEvent(this.reelsId);
}
