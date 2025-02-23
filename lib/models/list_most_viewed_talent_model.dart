/*
modelo para obtener la lista de talentos mas vistos
*/
class ListMostViewedTalentModel {
  final int count;
  final List<Talent> data;
  final String image;
  final String key;
  final String modelData;
  final String title;

  ListMostViewedTalentModel({
    required this.count,
    required this.data,
    required this.image,
    required this.key,
    required this.modelData,
    required this.title,
  });

  factory ListMostViewedTalentModel.fromJson(Map<String, dynamic> json) {
    try {
      return ListMostViewedTalentModel(
        count: json['count'] ?? 0,
        data:
            (json['data'] as List?)?.map((e) => Talent.fromJson(e)).toList() ??
                [],
        image: json['image'] ?? '',
        key: json['key'] ?? '',
        modelData: json['model_data']?.toString() ?? '',
        title: json['title'] ?? '',
      );
    } catch (e) {
      throw Exception('Error parsing ListMostViewedTalentModel: $e');
    }
  }
}

class Talent {
  final int id;
  final String email;
  final String name;
  final String slug;
  final String avatar;
  final String videoUrl;
  final int profileCompleted;
  final List<String> archetype;
  final List<String> hobbies;
  final List<String> knowledge;
  final List<String> skills;
  final List<String> tools;
  final List<String> dreamTeam;
  final List<String> dreamBrands;
  final List<String> dreamRoles;
  final List<String> languages;
  final List<String> opencallObjective;
  final List<String> typeAudiences;
  final String createdAt;
  final int? compatibility;
  final String? compatibilityReason;

  Talent({
    required this.id,
    required this.email,
    required this.name,
    required this.slug,
    required this.avatar,
    required this.videoUrl,
    required this.profileCompleted,
    required this.archetype,
    required this.hobbies,
    required this.knowledge,
    required this.skills,
    required this.tools,
    required this.dreamTeam,
    required this.dreamBrands,
    required this.dreamRoles,
    required this.languages,
    required this.opencallObjective,
    required this.typeAudiences,
    required this.createdAt,
    this.compatibility,
    this.compatibilityReason,
  });

  factory Talent.fromJson(Map<String, dynamic> json) {
    try {
      return Talent(
        id: json['id'] ?? 0,
        email: json['email'] ?? '',
        name: json['name'] ?? '',
        slug: json['slug'] ?? '',
        avatar: json['avatar'] ?? '',
        videoUrl: json['video_url'] ?? '',
        profileCompleted: json['profile_completed'] ?? 0,
        archetype: List<String>.from(json['archetype'] ?? []),
        hobbies: List<String>.from(json['hobbies'] ?? []),
        knowledge: List<String>.from(json['knowledge'] ?? []),
        skills: List<String>.from(json['skills'] ?? []),
        tools: List<String>.from(json['tools'] ?? []),
        dreamTeam: List<String>.from(json['dream_team'] ?? []),
        dreamBrands: List<String>.from(json['dream_brands'] ?? []),
        dreamRoles: List<String>.from(json['dream_roles'] ?? []),
        languages: List<String>.from(json['languages'] ?? []),
        opencallObjective: List<String>.from(json['opencall_objective'] ?? []),
        typeAudiences: List<String>.from(json['type_audiences'] ?? []),
        createdAt: json['created_at'] ?? '',
        compatibility: json['compatibility'],
        compatibilityReason: json['compatibility_reason'],
      );
    } catch (e) {
      throw Exception('Error parsing Talent: $e');
    }
  }
}
