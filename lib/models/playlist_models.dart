/*lista de IDs de portfolios en la playlist */
class PlayListModels {
  final int id;
  final String name;
  final List<int> portfolioIds;

  PlayListModels({
    required this.id,
    required this.name,
    required this.portfolioIds,
  });

  // Convertir de JSON a objeto
  factory PlayListModels.fromJson(Map<String, dynamic> json) {
    return PlayListModels(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      portfolioIds:
          (json['portfolioIds'] as List?)?.map((e) => e as int).toList() ?? [],
    );
  }

  // Convertir de objeto a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'portfolioIds': portfolioIds,
    };
  }
}
