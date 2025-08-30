import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItem {
  final String image;
  final String brandName;
  final String title;
  final double price;
  final double discountPrice;
  int quantity; // ✅ Add quantity property

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

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(CartItem item) {
    final index = state.indexWhere((element) => element.title == item.title);
    if (index != -1) {
      // ✅ If item exists, increase quantity
      state = [
        ...state.sublist(0, index),
        state[index].copyWith(quantity: state[index].quantity + 1),
        ...state.sublist(index + 1),
      ];
    } else {
      // ✅ Otherwise, add as a new item
      state = [...state, item];
    }
  }

  void removeFromCart(String title) {
    state = state.where((item) => item.title != title).toList();
  }

  void incrementQuantity(String title) {
    state = state.map((item) {
      if (item.title == title) {
        return item.copyWith(quantity: item.quantity + 1);
      }
      return item;
    }).toList();
  }

  void decrementQuantity(String title) {
    state = state.map((item) {
      if (item.title == title) {
        return item.quantity > 1
            ? item.copyWith(quantity: item.quantity - 1)
            : item;
      }
      return item;
    }).toList();
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

   
class BookmarkNotifier extends StateNotifier<List<ProductModel>> {
  BookmarkNotifier() : super([]);

  void toggleBookmark(ProductModel product) {
    if (state.contains(product)) {
      state = state.where((item) => item != product).toList();
    } else {
      state = [...state, product];
    }
  }
}

final bookmarkProvider = StateNotifierProvider<BookmarkNotifier, List<ProductModel>>((ref) {
  return BookmarkNotifier();
});

final selectedCategoryProvider = StateProvider<String>((ref) => "All");

final navigationProvider = StateNotifierProvider<NavigationNotifier, int>(
  (ref) => NavigationNotifier(),
);

class NavigationNotifier extends StateNotifier<int> {
  NavigationNotifier() : super(0);

  void setIndex(int index) {
    state = index;
  }
}