 
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/models/product_model.dart';

class BookmarkNotifier extends StateNotifier<List<ProductModel0>> {
  BookmarkNotifier() : super([]);

  void toggleBookmark(ProductModel0 product) {
    if (state.contains(product)) {
      state = state.where((item) => item != product).toList();
    } else {
      state = [...state, product];
    }
  }
}

final bookmarkProvider = StateNotifierProvider<BookmarkNotifier, List<ProductModel0>>((ref) {
  return BookmarkNotifier();
});
