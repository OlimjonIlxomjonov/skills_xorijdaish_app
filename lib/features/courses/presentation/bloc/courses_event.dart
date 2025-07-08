abstract class CoursesEvent {
  CoursesEvent();
}

class GetCountriesEvent extends CoursesEvent {}

class getCoursesEvent extends CoursesEvent {}

class GetSoftSkillsEvent extends CoursesEvent {
  final String query;

  GetSoftSkillsEvent(this.query);
}

class GetForeignLanguageEvent extends CoursesEvent {
  final String query;

  GetForeignLanguageEvent(this.query);
}

class PreTripEvent extends CoursesEvent {
  final String query;
  final int countryId;

  PreTripEvent(this.query, this.countryId);
}
