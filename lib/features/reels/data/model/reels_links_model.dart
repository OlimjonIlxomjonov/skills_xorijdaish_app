import '../../domain/entity/reels_links.dart';

class ReelsLinksModel extends ReelsLinks {
  ReelsLinksModel({
    required super.first,
    required super.last,
    super.prev,
    super.next,
  });

  factory ReelsLinksModel.fromJson(Map<String, dynamic> json) {
    return ReelsLinksModel(
      first: json['first'] ?? '',
      last: json['last'] ?? '',
      prev: json['prev'],
      next: json['next'],
    );
  }

  Map<String, dynamic> toJson() => {
    'first': first,
    'last': last,
    'prev': prev,
    'next': next,
  };
}
