import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/tickets_links.dart';

class TicketsLinksModel extends TicketsLinks {
  TicketsLinksModel({super.first, super.last, super.next, super.prev});

  factory TicketsLinksModel.fromJson(Map<String, dynamic> json) {
    return TicketsLinksModel(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }
}
