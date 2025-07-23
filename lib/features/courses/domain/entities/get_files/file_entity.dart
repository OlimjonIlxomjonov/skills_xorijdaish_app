class FileEntity {
  final int id;
  final int lessonId;
  final String fileName;
  final String fileExtension;
  final int fileSize;
  final String path;
  final String disk;
  final DateTime createdAt;
  final DateTime updatedAt;

  FileEntity({
    required this.id,
    required this.lessonId,
    required this.fileName,
    required this.fileExtension,
    required this.fileSize,
    required this.path,
    required this.disk,
    required this.createdAt,
    required this.updatedAt,
  });
}
