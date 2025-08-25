import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/ticket_files.dart';

class TicketFilesModel extends TicketFiles {
  TicketFilesModel({
    required super.id,
    required super.ticketMessageId,
    required super.fileExtension,
    required super.fileName,
    required super.path,
    required super.createdAt,
    required super.fileSize,
    required super.disk,
    required super.updatedAt,
  });

  factory TicketFilesModel.fromJson(Map<String, dynamic> json) {
    return TicketFilesModel(
      id: json['id'],
      ticketMessageId: json['ticket_message_id'],
      fileName: json['file_name'],
      fileExtension: json['file_extension'],
      fileSize: json['file_size'],
      path: json['path'],
      disk: json['disk'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
