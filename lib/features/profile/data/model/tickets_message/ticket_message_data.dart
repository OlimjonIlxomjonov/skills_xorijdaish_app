import 'package:skills_xorijdaish/features/profile/data/model/tickets_message/ticket_files_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/tickets_message/ticket_user.dart';
import 'package:skills_xorijdaish/features/profile/data/model/tickets_message/tickets_message_model.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/ticket_message_data.dart';

import '../../../../../core/utils/json_parsers.dart';
import '../../../../../core/utils/logger/logger.dart';

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
    try {
      return TicketMessageDataModel(
        id: parseInt(json['id']),
        text: parseString(json['text']),
        user: TicketUserModel.fromJson(json['user'] ?? <String, dynamic>{}),
        ticket: TicketsMessageModel.fromJson(
          json['ticket'] ?? <String, dynamic>{},
        ),
        isAdmin: parseBool(json['is_admin']),
        sentAt: parseString(json['sent_at']),
        sentAtHuman: parseString(json['sent_at_human']),
        files: parseList<TicketFilesModel>(
          json['files'],
          (m) => TicketFilesModel.fromJson(m),
        ),
      );
    } catch (e, st) {
      logger.w('TicketMessageDataModel.fromJson error: $e\n$json\n$st');
      rethrow;
    }
  }
}
