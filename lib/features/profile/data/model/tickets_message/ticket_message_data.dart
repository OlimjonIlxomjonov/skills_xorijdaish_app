import 'package:skills_xorijdaish/features/profile/data/model/tickets_message/ticket_files_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/tickets_message/ticket_user.dart';
import 'package:skills_xorijdaish/features/profile/data/model/tickets_message/tickets_message_model.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/ticket_message_data.dart';

class TicketMessageDataModel extends MessageData {
  TicketMessageDataModel({
    required super.id,
    required super.text,
    required super.user,
    required super.ticket,
    required super.isAdmin,
    required super.sentAt,
    required super.sentAtHuman,
    required super.files,
  });

  factory TicketMessageDataModel.fromJson(Map<String, dynamic> json) {
    return TicketMessageDataModel(
      id: json['id'] ?? 0,
      text: json['text'] ?? '',
      user: TicketUserModel.fromJson(json['user']),
      ticket: TicketsMessageModel.fromJson(json['ticket']),
      isAdmin: json['is_admin'] ?? false,
      sentAt: json['sent_at'] ?? '',
      sentAtHuman: json['sent_at_human'] ?? '',
      files:
          json['files'] != null
              ? (json['files'] as List<dynamic>)
                  .map(
                    (e) => TicketFilesModel.fromJson(e as Map<String, dynamic>),
                  )
                  .toList()
              : [],
    );
  }
}
