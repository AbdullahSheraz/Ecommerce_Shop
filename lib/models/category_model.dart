class Category {
  final String name;
  final String? imageUrl;

  Category({
    required this.name,
    this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['label'] ?? 'Unnamed',
      imageUrl: json['path'],
    );
  }
}
