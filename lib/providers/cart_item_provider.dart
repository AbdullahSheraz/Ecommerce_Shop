import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/models/cartItem_model.dart';


class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(CartItem item) {
    final index = state.indexWhere((element) => element.title == item.title);
    if (index != -1) {
      state = [
        ...state.sublist(0, index),
        state[index].copyWith(quantity: state[index].quantity + 1),
        ...state.sublist(index + 1),
      ];
    } else {
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
