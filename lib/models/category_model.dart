class Category {
  final int id;
  final String name;
  final String? imageUrl;

  Category({
    required this.id,
    required this.name,
    this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['value'] ?? 0,
      name: json['label'] ?? 'Unnamed',
      imageUrl: json['path'],
    );
  }
}
