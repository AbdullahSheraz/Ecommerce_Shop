 class Brand {
  final int id; 
  final String name;  
  final String? imageUrl;  
  final String? imageName; 

  Brand({
    required this.id,
    required this.name,
    this.imageUrl,
    this.imageName,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['value'] ?? 0,
      name: json['label'] ?? 'Unnamed',
      imageUrl: json['path'],
      imageName: json['image'],
    );
  }
}
