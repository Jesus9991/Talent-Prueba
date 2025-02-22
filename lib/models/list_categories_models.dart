/*
modelo para manejar las categorias
*/
class ListCategoryModels {
  final String id;
  final String category;

  ListCategoryModels({
    required this.id,
    required this.category,
  });

  // Método para convertir un JSON en una instancia de Category
  factory ListCategoryModels.fromJson(Map<String, dynamic> json) {
    return ListCategoryModels(
      id: json['id'],
      category: json['category'],
    );
  }
}
