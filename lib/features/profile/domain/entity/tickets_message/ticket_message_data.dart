import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/ticket_files.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/ticket_user.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/tickets_message_entity.dart';

class MessageData {
  final int id;
  final String text;
  final TicketUser user;
  final TicketsMessageEntity ticket;
  final List<TicketFiles> files;
  final bool isAdmin;
  final String sentAt;
  final String sentAtHuman;

  MessageData({
    required this.files,
    required this.id,
    required this.text,
    required this.user,
    required this.ticket,
    required this.isAdmin,
    required this.sentAt,
    required this.sentAtHuman,
  });
}
