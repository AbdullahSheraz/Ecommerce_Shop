

class CartItem {
  final String image;
  final String brandName;
  final String title;
  final double price;
  final double discountPrice;
  int quantity;

  CartItem({
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    required this.discountPrice,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      image: image,
      brandName: brandName,
      title: title,
      price: price,
      discountPrice: discountPrice,
      quantity: quantity ?? this.quantity,
    );
  }
}
