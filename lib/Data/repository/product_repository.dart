import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop/data/services/product_service.dart';
import 'package:shop/models/brand_model.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/models/item_model.dart';
part 'product_repository.g.dart';

@riverpod
ProductRepository productRepo(Ref ref) {
  return ProductRepository();
}

class ProductRepository {
  ProductService productService = ProductService();
  Future<List<Category>> getCategories() async {
    try {
      return await productService.getCategories();
    } catch (e) {
      print('Error fetching categories: $e');
      throw Exception('Failed to fetch categories: $e');
    }
  }

  Future<List<Brand>> getBrands() async {
    try {
      return await productService.getBrands();
    } catch (e) {
      print('Error fetching categories: $e');
      throw Exception('Failed to fetch categories: $e');
    }
  }
    Future<List<Item>> getItems(String categoryId,String brandId) async {
    try {
      return await productService.getItems(categoryId,brandId);
    } catch (e) {
      print('Error fetching Items: $e');
      throw Exception('Failed to fetch Items: $e');
    }
  }
}
