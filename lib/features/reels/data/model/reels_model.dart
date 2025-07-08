import '../../domain/entity/reels_entity.dart';

class ReelsModel extends ReelsEntity {
  ReelsModel({
    required super.id,
    required super.title,
    required super.text,
    required super.image,
    required super.imageUrl,
    required super.link,
    required super.isLiked,
    required super.likes,
    required super.views,
    required super.url,
  });

  factory ReelsModel.fromJson(Map<String, dynamic> json) {
    return ReelsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      text: json['text'] ?? '',
      image: json['image'] ?? '',
      imageUrl: json['image_url'] ?? '',
      link: json['link'] ?? '',
      isLiked: json['is_liked'] ?? false,
      likes: json['likes'] ?? 0,
      views: json['views'] ?? 0,
        url: json['url'] ?? 'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',

    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'text': text,
    'image': image,
    'image_url': imageUrl,
    'link': link,
    'is_liked': isLiked,
    'likes': likes,
    'views': views,
    'url': url,
  };
}
