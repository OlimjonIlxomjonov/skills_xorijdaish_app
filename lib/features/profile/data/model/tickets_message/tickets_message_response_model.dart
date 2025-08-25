import 'package:skills_xorijdaish/features/profile/data/model/tickets_message/ticket_message_data.dart';
import 'package:skills_xorijdaish/features/profile/data/model/tickets_message/tickets_links_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/tickets_message/tickets_meta_model.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/tickets_message_response.dart';

class TicketsMessageResponseModel extends TicketsMessageResponse {
  TicketsMessageResponseModel({
    required super.data,
    required super.links,
    required super.meta,
  });

  factory TicketsMessageResponseModel.fromJson(Map<String, dynamic> json) {
    return TicketsMessageResponseModel(
      data:
          (json['data'] as List)
              .map((e) => TicketMessageDataModel.fromJson(e))
              .toList(),
      links: TicketsLinksModel.fromJson(json['links']),
      meta: TicketsMetaModel.fromJson(json['meta']),
    );
  }
}
