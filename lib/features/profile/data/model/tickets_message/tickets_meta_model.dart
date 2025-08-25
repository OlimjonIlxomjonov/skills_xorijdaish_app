import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/tickets_meta.dart';

class TicketsMetaModel extends TicketsMeta {
  TicketsMetaModel({
    required super.currentPage,
    required super.from,
    required super.lastPage,
    required super.to,
    required super.total,
  });

  factory TicketsMetaModel.fromJson(Map<String, dynamic> json) {
    return TicketsMetaModel(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      to: json['to'],
      total: json['total'],
    );
  }
}
