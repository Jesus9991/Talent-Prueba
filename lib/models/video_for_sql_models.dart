/*
modelo para guardar videos
*/
class PortfolioForVideosModels {
  final int id;
  final String name;
  final String slug;
  final String avatar;
  final String videoUrl;

  PortfolioForVideosModels({
    required this.id,
    required this.name,
    required this.slug,
    required this.avatar,
    required this.videoUrl,
  });

  factory PortfolioForVideosModels.fromJson(Map<String, dynamic> json) {
    return PortfolioForVideosModels(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      avatar: json['avatar'] ?? '',
      videoUrl: json['video_url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'avatar': avatar,
      'video_url': videoUrl,
    };
  }
}
