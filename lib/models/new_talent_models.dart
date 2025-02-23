/*
PROVIDER: modelo para nuevos talentos
*/
class NewTalentModels {
  final int count;
  final List<TalentData> data;
  final String image;
  final String key;
  final String modelData;
  final String title;

  NewTalentModels({
    required this.count,
    required this.data,
    required this.image,
    required this.key,
    required this.modelData,
    required this.title,
  });

  factory NewTalentModels.fromJson(Map<String, dynamic> json) {
    return NewTalentModels(
      count: json['count'] ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => TalentData.fromJson(e))
              .toList() ??
          [],
      image: json['image'] ?? '',
      key: json['key'] ?? '',
      modelData: json['model_data']?.toString() ?? '',
      title: json['title'] ?? '',
    );
  }
}

class TalentData {
  final String about;
  final List<String> archetype;
  final String avatar;
  final String avatar200;
  final String avatar400;
  final String behance;
  final String benefitsInCompanies;
  final String career;
  final String city;
  final String? compatibility;
  final String? compatibilityReason;
  final String connected;
  final String country;
  final String createdAt;
  final String desiredRole;
  final List<String> dreamBrands;
  final List<String> dreamRoles;
  final List<String> dreamTeam;
  final String email;
  final String facebook;
  final String github;
  final List<String> hobbies;
  final int id;
  final String instagram;
  final List<String> knowledge;
  final String knowledges;
  final List<String> languages;
  final String linkedin;
  final int matchesCount;
  final String myLanguages;
  final String name;
  final String onboardingGoal;
  final List<String> opencallObjective;
  final String resumeDescription;
  final bool resumeDownload;
  final int resumeId;
  final String resumeImage;
  final String resumeName;
  final int reviewCount;
  final int reviewGeneralUser;
  final bool save;
  final int sharedCount;
  final List<String> skills;
  final String slug;
  final bool sponsored;
  final List<String> tools;
  final String video;
  final String videoUrl;
  final String position;

  TalentData({
    required this.about,
    required this.archetype,
    required this.avatar,
    required this.avatar200,
    required this.avatar400,
    required this.behance,
    required this.benefitsInCompanies,
    required this.career,
    required this.city,
    this.compatibility,
    this.compatibilityReason,
    required this.connected,
    required this.country,
    required this.createdAt,
    required this.desiredRole,
    required this.dreamBrands,
    required this.dreamRoles,
    required this.dreamTeam,
    required this.email,
    required this.facebook,
    required this.github,
    required this.hobbies,
    required this.id,
    required this.instagram,
    required this.knowledge,
    required this.knowledges,
    required this.languages,
    required this.linkedin,
    required this.matchesCount,
    required this.myLanguages,
    required this.name,
    required this.onboardingGoal,
    required this.opencallObjective,
    required this.resumeDescription,
    required this.resumeDownload,
    required this.resumeId,
    required this.resumeImage,
    required this.resumeName,
    required this.reviewCount,
    required this.reviewGeneralUser,
    required this.save,
    required this.sharedCount,
    required this.skills,
    required this.slug,
    required this.sponsored,
    required this.tools,
    required this.video,
    required this.videoUrl,
    required this.position,
  });

  factory TalentData.fromJson(Map<String, dynamic> json) {
    return TalentData(
      about: json['about'] ?? '',
      archetype: List<String>.from(json['archetype'] ?? []),
      avatar: json['avatar'] ?? '',
      avatar200: json['avatar_200'] ?? '',
      avatar400: json['avatar_400'] ?? '',
      behance: json['behance'] ?? '',
      benefitsInCompanies: json['benefits_in_companies'] ?? '',
      career: json['career'] ?? '',
      city: json['city'] ?? '',
      compatibility: json['compatibility'],
      compatibilityReason: json['compatibility_reason'],
      connected: json['connected'] ?? '',
      country: json['country'] ?? '',
      createdAt: json['created_at'] ?? '',
      desiredRole: json['desired_role'] ?? '',
      dreamBrands: List<String>.from(json['dream_brands'] ?? []),
      dreamRoles: List<String>.from(json['dream_roles'] ?? []),
      dreamTeam: List<String>.from(json['dream_team'] ?? []),
      email: json['email'] ?? '',
      facebook: json['facebook'] ?? '',
      github: json['github'] ?? '',
      hobbies: List<String>.from(json['hobbies'] ?? []),
      id: json['id'] ?? 0,
      instagram: json['instagram'] ?? '',
      knowledge: List<String>.from(json['knowledge'] ?? []),
      knowledges: json['knowledges'] ?? '',
      languages: List<String>.from(json['languages'] ?? []),
      linkedin: json['linkedin'] ?? '',
      matchesCount: json['matches_count'] ?? 0,
      myLanguages: json['my_languages'] ?? '',
      name: json['name'] ?? '',
      onboardingGoal: json['onboarding_goal'] ?? '',
      opencallObjective: List<String>.from(json['opencall_objective'] ?? []),
      resumeDescription: json['resume_description'] ?? '',
      resumeDownload: json['resume_download'] ?? false,
      resumeId: json['resume_id'] ?? 0,
      resumeImage: json['resume_image'] ?? '',
      resumeName: json['resume_name'] ?? '',
      reviewCount: json['review_count'] ?? 0,
      reviewGeneralUser: json['review_general_user'] ?? 0,
      save: json['save'] ?? false,
      sharedCount: json['shared_count'] ?? 0,
      skills: List<String>.from(json['skills'] ?? []),
      slug: json['slug'] ?? '',
      sponsored: json['sponsored'] ?? false,
      tools: List<String>.from(json['tools'] ?? []),
      video: json['video'] ?? '',
      videoUrl: json['video_url'] ?? '',
      position: json['position'] ?? '',
    );
  }
}
