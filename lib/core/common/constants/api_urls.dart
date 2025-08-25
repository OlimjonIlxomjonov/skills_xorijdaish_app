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
  static const preTripByCountry = '/api/courses/pre-trip-courses?country_id=';

  /// Course Tests
  static const testAnswers = '/api/courses/';
  static const selectPairs = '/api/courses/';
  static const answerSelectPairs = '/api/courses/';
  static const finishTest = '/api/courses/';
  static const finalTestCourse = '/api/courses/';
  static const finalTestById = '/api/courses/';
  static const listenNComplete = '/api/courses/';
  static const answerListenNComplete = '/api/courses/';
  static const fillInTheBlank = '/api/courses/';
  static const listenNCompleteWords = '/api/courses/';
  static const multipleChoiceWithPictures = '/api/courses/';
  static const answerFillInTheBlank = '/api/courses/';
  static const listenNSelectPairs = '/api/courses/';

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
  static const updateAvatar = '/api/my-img';

  /// Lessons
  static const lessons = '/api/courses/';
  static const video = '/api/courses/';
  static const file = '/api/courses/';
  static const lessonTests = '/api/courses/';
  static const testById = '/api/courses/';
  static const startACourse = '/api/courses/';
  static const lessonById = '/api/courses/';

  /// Statistics
  static const averageTime = '/api/stats/average';
  static const weekly = '/api/stats/week';
  static const courseTime = '/api/stats/courses?date=';

  /// Notifications
  static const notifications = '/api/notifications';
  static const notificationsCount = '/api/notifications/unread-count';
  static const readAll = '/api/notifications/read-all';

  /// Search
  static const search = '/api/search?search=';

  /// Set Video Time
  static const setVideoTime = '/api/courses/';

  /// banners
  static const banners = '/api/banners';

  /// Tickets
  static const ticketsMessage = '/api/tickets/';

  /// Finish Final test
  static const finishFinalTest = '/api/courses/';
  static const ansFinalSelectPairs = '/api/courses/';
  static const ansFinalMultipleChoice = '/api/courses/';
  static const ansFinalListenNComplete = '/api/courses/';
  static const ansFinalFillInTheBlank = '/api/courses/';
  static const ansFinalListenNCompleteWords = '/api/courses/';
  static const ansFinalMultipleChoiceWithPictures = '/api/courses/';
  static const ansFinalListenNSelectPairs = '/api/courses/';

  /// ====

  /// BUY a Course
  static const buyACourse = '/api/payment/click';

  /// Tickets Chat
  static const sendMessage = '/api/tickets/';
  static const downloadImage = '/api/tickets/';

  /// tests (all)
  static const finalTestResponse = '/api/courses/';

  /// Rate A Course
  static const rateACourse = '/api/courses/';
}
