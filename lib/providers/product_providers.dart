import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop/data/repository/product_repository.dart';
import 'package:shop/models/brand_model.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/models/item_model.dart';
part 'product_providers.g.dart';

@Riverpod(keepAlive: true)
Future<List<Category>> getCategories(Ref ref) async {
  final repo = ref.read(productRepoProvider);
  return await repo.getCategories();
}

@Riverpod(keepAlive: true)
Future<List<Brand>> getBrands(Ref ref) async {
  final repo = ref.read(productRepoProvider);
  return await repo.getBrands();
}
@Riverpod(keepAlive: true)
Future<List<Item>> getItems(Ref ref,String categoryId,String brandId) async {
  final repo = ref.read(productRepoProvider);
  return await repo.getItems(categoryId,brandId);
}