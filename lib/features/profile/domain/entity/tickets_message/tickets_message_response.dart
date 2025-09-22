import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/ticket_message_data.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/tickets_links.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/tickets_meta.dart';

class TicketsMessageResponse {
  final List<MessageData> data;
  final TicketsLinks links;
  final TicketsMeta meta;

  TicketsMessageResponse({
    required this.data,
    required this.links,
    required this.meta,
  });


}
