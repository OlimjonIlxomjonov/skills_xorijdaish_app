class NotificationEntity {
  final int id;
  final int userId;
  final String title;
  final String text;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isRead;

  NotificationEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
    required this.isRead,
  });


}