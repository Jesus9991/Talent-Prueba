/*
PROVIDER PARA MANEJENAR LOS PORTAFOLIO MAS VISTOS 
*/

class MostViewedPortfoliosModels {
  final int count;
  final List<Portfolio> data;
  final String image;
  String key;
  final String modelData;
  final String title;

  MostViewedPortfoliosModels({
    required this.image,
    required this.key,
    required this.modelData,
    required this.count,
    required this.data,
    required this.title,
  });

  factory MostViewedPortfoliosModels.fromJson(Map<String, dynamic> json) {
    return MostViewedPortfoliosModels(
      count: json['count'] ?? 0,
      data:
          (json['data'] as List?)?.map((e) => Portfolio.fromJson(e)).toList() ??
              [],
      image: json['image'] ?? '',
      key: json['key'] ?? '',
      modelData: json['model_data'] ?? '',
      title: json['title'] ?? '',
    );
  }
}

class Portfolio {
  final int id;
  final String email;
  final String name;
  final String slug;
  final String avatar;
  final String avatar200;
  final String avatar400;
  final String videoUrl;
  final String video;
  final int profileCompleted;
  final String about;
  final String city;
  final String position;
  final String country;
  final String career;
  final List<String> skills;
  final int resumeId;
  final String resumeDescription;
  final bool resumeDownload;
  final String resumeImage;
  final String resumeName;
  final int matchesCount;
  final int reviewCount;
  final int sharedCount;
  final String typeAudience;
  final List<String> typeAudiences;
  final String createdAt;
  final List<String> hobbies;
  final String instagram;
  final String facebook;
  final List<String> languages;
  final List<String> tools;
  final List<String> knowledge;

  Portfolio({
    required this.id,
    required this.email,
    required this.name,
    required this.slug,
    required this.avatar,
    required this.avatar200,
    required this.avatar400,
    required this.videoUrl,
    required this.video,
    required this.profileCompleted,
    required this.about,
    required this.city,
    required this.position,
    required this.country,
    required this.career,
    required this.skills,
    required this.resumeId,
    required this.resumeDescription,
    required this.resumeDownload,
    required this.resumeImage,
    required this.resumeName,
    required this.matchesCount,
    required this.reviewCount,
    required this.sharedCount,
    required this.typeAudience,
    required this.typeAudiences,
    required this.createdAt,
    required this.hobbies,
    required this.facebook,
    required this.instagram,
    required this.languages,
    required this.tools,
    required this.knowledge,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) {
    return Portfolio(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      avatar: json['avatar'] ?? '',
      avatar200: json['avatar_200'] ?? '',
      avatar400: json['avatar_400'] ?? '',
      videoUrl: json['video_url'] ?? '',
      video: json['video'] ?? '',
      profileCompleted: json['profile_completed'] ?? 0,
      about: json['about'] ?? '',
      city: json['city'] ?? '',
      position: json['position'] ?? '',
      country: json['country'] ?? '',
      career: json['career'] ?? '',
      skills:
          (json['skills'] as List?)?.map((e) => e.toString()).toList() ?? [],
      resumeId: json['resume_id'] ?? 0,
      resumeDescription: json['resume_description'] ?? '',
      resumeDownload: json['resume_download'] ?? false,
      resumeImage: json['resume_image'] ?? '',
      resumeName: json['resume_name'] ?? '',
      matchesCount: json['matches_count'] ?? 0,
      reviewCount: json['review_count'] ?? 0,
      sharedCount: json['shared_count'] ?? 0,
      typeAudience: json['type_audience'] ?? '',
      typeAudiences: (json['type_audiences'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      createdAt: json['created_at'] ?? '',
      hobbies:
          (json['hobbies'] as List?)?.map((e) => e.toString()).toList() ?? [],
      facebook: json['facebook'] ?? '',
      instagram: json['instagram'] ?? '',
      languages: List<String>.from(json['languages'] ?? []),
      tools: List<String>.from(json['tools'] ?? []),
      knowledge: List<String>.from(json['knowledge'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'slug': slug,
      'avatar': avatar,
      'avatar_200': avatar200,
      'avatar_400': avatar400,
      'video_url': videoUrl,
      'video': video,
      'profile_completed': profileCompleted,
      'about': about,
      'city': city,
      'position': position,
      'country': country,
      'career': career,
      'skills': skills.join(','), // Guardar como String separado por comas
      'resume_id': resumeId,
      'resume_description': resumeDescription,
      'resume_download': resumeDownload ? 1 : 0,
      'resume_image': resumeImage,
      'resume_name': resumeName,
      'matches_count': matchesCount,
      'review_count': reviewCount,
      'shared_count': sharedCount,
      'type_audience': typeAudience,
      'type_audiences': typeAudiences.join(','),
      'created_at': createdAt,
      'hobbies': hobbies.join(','),
      'facebook': facebook,
      'instagram': instagram,
      'languages': languages.join(','),
      'tools': tools.join(','),
      'knowledge': knowledge.join(','),
    };
  }
}
