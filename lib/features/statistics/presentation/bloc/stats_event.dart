class StatsEvent {
  StatsEvent();
}

class AverageEvent extends StatsEvent {}

class WeekEvent extends StatsEvent {}

class CourseTimeEvent extends StatsEvent {
  final DateTime date;

  CourseTimeEvent(this.date);
}
