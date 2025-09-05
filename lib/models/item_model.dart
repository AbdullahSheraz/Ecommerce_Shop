class Item {
  final int itemId;
  final String itemCode;
  final String description;
  final String price;
  final int categoryId;
  final String category;
  final int brandId;
  final String brand;
  final List<ItemImage> images;

  Item({
    required this.itemId,
    required this.itemCode,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.category,
    required this.brandId,
    required this.brand,
    required this.images,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      itemId: json['itemid'] as int,
      itemCode: json['itemcode'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '0.0',
      categoryId: json['categoryid'] as int,
      category: json['category'] ?? '',
      brandId: json['brandid'] as int,
      brand: json['brand'] ?? '',
      images: (json['images'] as List<dynamic>)
          .map((e) => ItemImage.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'itemid': itemId,
      'itemcode': itemCode,
      'description': description,
      'price': price,
      'categoryid': categoryId,
      'category': category,
      'brandid': brandId,
      'brand': brand,
      'images': images.map((e) => e.toJson()).toList(),
    };
  }
}

class ItemImage {
  final String src;
  final String name;

  ItemImage({required this.src, required this.name});

  factory ItemImage.fromJson(Map<String, dynamic> json) {
    return ItemImage(
      src: json['src'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'src': src,
      'name': name,
    };
  }
}
