/*
modelo para obtener las personas destacadas en el home
*/
class HightlightPersonHomeModels {
  final int count;
  String key;
  final String title;
  final List<HightlightData> data;

  HightlightPersonHomeModels({
    required this.count,
    required this.data,
    required this.key,
    required this.title,
  });

  factory HightlightPersonHomeModels.fromJson(Map<String, dynamic> json) {
    try {
      return HightlightPersonHomeModels(
        key: json['key'] ?? '',
        title: json['title'] ?? '',
        count: json['count'] ?? 0,
        data: (json['data'] as List?)
                ?.map((item) => HightlightData.fromJson(item))
                .toList() ??
            [],
      );
    } catch (e) {
      throw FormatException("Error parsing ListCategoriesHome: \$e");
    }
  }
}

class HightlightData {
  final int id;
  final String name;
  final String avatar;
  final String typeAudience;
  final String about;
  final String career;
  final String city;
  final String createdAt;
  final List<String> hobbies;
  final List<String> knowledge;
  final List<String> languages;
  final String linkedin;
  final String resume;
  final List<String> skills;
  final String slug;
  final List<String> tools;
  final String videoUrl;
  final String video;
  final int shared;
  final int review;
  final String facebook;
  final String instagram;
  final String position;
  final String resumeimage;

  HightlightData({
    required this.avatar,
    required this.typeAudience,
    required this.name,
    required this.id,
    required this.about,
    required this.career,
    required this.city,
    required this.createdAt,
    required this.hobbies,
    required this.knowledge,
    required this.languages,
    required this.linkedin,
    required this.resume,
    required this.skills,
    required this.slug,
    required this.tools,
    required this.videoUrl,
    required this.video,
    required this.shared,
    required this.review,
    required this.facebook,
    required this.instagram,
    required this.position,
    required this.resumeimage,
  });

  factory HightlightData.fromJson(Map<String, dynamic> json) {
    try {
      return HightlightData(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        avatar: json['avatar'] ?? '',
        typeAudience: json['type_audience'] ?? '',
        about: json['about'] ?? '',
        career: json['career'] ?? '',
        city: json['city'] ?? '',
        createdAt: json['created_at'] ?? '',
        hobbies: List<String>.from(json['hobbies'] ?? []),
        knowledge: List<String>.from(json['knowledge'] ?? []),
        languages: List<String>.from(json['languages'] ?? []),
        linkedin: json['linkedin'] ?? '',
        resume: json['resume_description'] ?? '',
        skills: List<String>.from(json['skills'] ?? []),
        slug: json['slug'] ?? '',
        tools: List<String>.from(json['tools'] ?? []),
        videoUrl: json['video_url'] ?? '',
        video: json['video'] ?? '',
        shared: json['shared_count'] ?? '',
        review: json['review_count'] ?? '',
        facebook: json['facebook'] ?? '',
        instagram: json['instagram'] ?? '',
        position: json['position'] ?? '',
        resumeimage: json['resume_image'] ?? '',
      );
    } catch (e) {
      throw FormatException("Error parsing HightlightData: \$e");
    }
  }
}
