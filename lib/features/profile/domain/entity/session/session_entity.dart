class SessionEntity {
  final String id;
  final String name;
  final String? location;
  final String? ip;
  final bool isMe;
  final String updatedAt;
  final String updatedAtHuman;

  SessionEntity({
    required this.id,
    required this.name,
    this.location,
    this.ip,
    required this.isMe,
    required this.updatedAt,
    required this.updatedAtHuman,
  });
}
