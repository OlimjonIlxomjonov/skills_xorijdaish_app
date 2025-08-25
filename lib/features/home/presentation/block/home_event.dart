class HomeEvent {
  HomeEvent();
}

class NotificationsEvent extends HomeEvent {
  final int page;

  NotificationsEvent(this.page);
}

class SearchEvent extends HomeEvent {
  final String query;

  SearchEvent(this.query);
}

class NotifCountEvent extends HomeEvent {}

class ReadAllEvent extends HomeEvent {}

class BannersEvent extends HomeEvent {}
