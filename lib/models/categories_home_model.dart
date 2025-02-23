/*
modelos para manejar las categorias en el home
*/
class CategoriesHomeModel {
  final int count;
  final List<Categories> data;
  final int limit;
  final int page;

  CategoriesHomeModel({
    required this.count,
    required this.data,
    required this.limit,
    required this.page,
  });

  factory CategoriesHomeModel.fromJson(Map<String, dynamic> json) {
    return CategoriesHomeModel(
      count: json["count"] ?? 0,
      data: (json["data"] as List?)
              ?.map((item) => Categories.fromJson(item))
              .toList() ??
          [],
      limit: json["limit"] ?? 0,
      page: json["page"] ?? 0,
    );
  }
}

class Categories {
  final String title;
  final String key;
  final String url;
  final String type;
  final String image;
  final int? count;
  final String categoryType;

  Categories({
    required this.title,
    required this.key,
    required this.url,
    required this.type,
    required this.image,
    this.count,
    required this.categoryType,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      title: json["title"] ?? "Unknown",
      key: json["key"] ?? "",
      url: json["url"] ?? "",
      type: json["type"] ?? "",
      image: json["image"] ?? "",
      count: json["count"],
      categoryType: json["category_type"] ?? "",
    );
  }
}
