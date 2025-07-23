abstract class ApiUrls {
  /// BASE URL

  static const baseUrl = 'https://admin-skills.xorijdaish.uz';

  // static const baseUrl = 'https://skills.avacoder.uz';

  static const allCountries = '/api/countries';

  static const allCourses = '/api/courses';

  /// Courses
  static const softSkillsLessons = '/api/courses/';
  static const foreignLanguageLessons = '/api/courses/';
  static const preTripCourses = '/api/courses/';
  static const skillTest = '/api/courses/';
  static const coursesById = '/api/courses/';
  static const myCourses = '/api/courses/my';

  /// Course Tests
  static const testAnswers = '/api/courses/';

  /// Reels
  static const reels = '/api/reels';
  static const reelsLike = '/api/reels/';

  /// Profile
  static const selfInfo = '/api/me';
  static const sessions = '/api/sessions';
  static const revokeSession = '/api/sessions/';
  static const support = '/api/tickets';
  static const tickets = '/api/tickets';
  static const createTicket = '/api/tickets/store';
  static const myCertificates = '/api/certificates/my';

  /// Lessons
  static const lessons = '/api/courses/';
  static const video = '/api/courses/';
  static const file = '/api/courses/';
  static const lessonTests = '/api/courses/';
  static const testById = '/api/courses/';
  static const startACourse = '/api/courses/';

  /// Statistics
  static const averageTime = '/api/stats/average';
  static const weekly = '/api/stats/week';
  static const courseTime = '/api/stats/courses?date=';
}
