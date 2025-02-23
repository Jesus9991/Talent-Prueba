/*
modelo para obtener las personas destacadas en el home
*/
class HightlightPersonHomeModels {
  final int count;
  final String key;
  final List<HightlightData> data;

  HightlightPersonHomeModels(
      {required this.count, required this.data, required this.key});

  factory HightlightPersonHomeModels.fromJson(Map<String, dynamic> json) {
    try {
      return HightlightPersonHomeModels(
        key: json['key'] ?? '',
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
  final String avatar;
  final String typeAudience;
  final String name;
  final int id;

  HightlightData({
    required this.avatar,
    required this.typeAudience,
    required this.name,
    required this.id,
  });

  factory HightlightData.fromJson(Map<String, dynamic> json) {
    try {
      return HightlightData(
        avatar: json['avatar'] ?? '',
        typeAudience: json['type_audience'] ?? '',
        name: json['name'] ?? '',
        id: json['id'] ?? 0,
      );
    } catch (e) {
      throw FormatException("Error parsing CategoryData: \$e");
    }
  }
}
