import 'dart:convert';

/*
MODELO: modelo para la data del home
*/
class HomeDataModel {
  final int count;
  final List<CategoryData> data;
  final int limit;
  final int page;

  HomeDataModel({
    required this.count,
    required this.data,
    required this.limit,
    required this.page,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      count: json['count'] ?? 0,
      data: (json['data'] as List?)
              ?.map((e) => CategoryData.fromJson(e))
              .toList() ??
          [],
      limit: json['limit'] ?? 0,
      page: json['page'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'count': count,
        'data': data.map((e) => e.toJson()).toList(),
        'limit': limit,
        'page': page,
      };
}

class CategoryData {
  final String title;
  final String key;
  final String url;
  final String type;
  final String image;
  final int? count;
  final String categoryType;

  CategoryData({
    required this.title,
    required this.key,
    required this.url,
    required this.type,
    required this.image,
    required this.count,
    required this.categoryType,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      title: json['title'] ?? 'Sin título',
      key: json['key'] ?? '',
      url: json['url'] ?? '',
      type: json['type'] ?? '',
      image: json['image'] ?? '',
      count: json['count'],
      categoryType: json['category_type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'key': key,
        'url': url,
        'type': type,
        'image': image,
        'count': count,
        'category_type': categoryType,
      };
}

HomeDataModel homeDataModelFromJson(String str) {
  try {
    return HomeDataModel.fromJson(json.decode(str));
  } catch (e) {
    return HomeDataModel(count: 0, data: [], limit: 0, page: 0);
  }
}

String homeDataModelToJson(HomeDataModel data) {
  return json.encode(data.toJson());
}
