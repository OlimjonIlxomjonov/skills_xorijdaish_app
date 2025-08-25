class TicketsMessageEntity {
  final int id;
  final int userId;
  final dynamic adminId;
  final String title;
  final String phoneNumber;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  TicketsMessageEntity({
    required this.id,
    required this.userId,
    this.adminId,
    required this.title,
    required this.phoneNumber,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
}
