class TicketFiles {
  final int id;
  final int ticketMessageId;
  final String fileName;
  final String fileExtension;
  final int fileSize;
  final String path;
  final String disk;
  final String createdAt;
  final String updatedAt;

  TicketFiles({
    required this.id,
    required this.ticketMessageId,
    required this.fileName,
    required this.fileExtension,
    required this.fileSize,
    required this.path,
    required this.disk,
    required this.createdAt,
    required this.updatedAt,
  });
}
