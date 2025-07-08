class ReelsEntity {
  final int id;
  final String? title;
  final String? text;
  final String? image;
  final String? imageUrl;
  final String? link;
  final bool isLiked;
  final int likes;
  final int views;
  final String? url;

  ReelsEntity({
    required this.id,
    this.title,
    this.text,
    this.image,
    this.imageUrl,
    this.link,
    required this.isLiked,
    required this.likes,
    required this.views,
    this.url,
  });
}
