import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop/data/repository/auth_repository.dart';
import 'package:shop/models/brand_model.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/models/user_model.dart';

part 'auth_providers.g.dart';

@riverpod
class AuthProviders extends _$AuthProviders {
  @override
  bool build() {
    return false;
  }

  Future<Map<String, dynamic>> registerUser(Map<String, dynamic> body) async {
    final repo = ref.read(authRepoProvider);

    final result = await repo.registerUser(body);

    if (result["success"] == true || result["status"] == "success") {
      state = true;
    }

    return result;
  }

  Future<Map<String, dynamic>> loginUser(Map<String, dynamic> body) async {
    final repo = ref.read(authRepoProvider);
    final result = await repo.loginUser(body);

    if (result["success"] == true || result["status"] == "success") {
      state = true;
    }

    return result;
  }
  
}

@riverpod
Future<UserModel> userProfile(UserProfileRef ref) async {
  final repo = ref.read(authRepoProvider);
  return await repo.userInfo();
}

@riverpod
Future<List<Category>> categories(CategoriesRef ref) async {
  final repo = ref.read(authRepoProvider); 
  return await repo.fetchCategories();
}
@riverpod
Future<List<Brand>> brands(BrandsRef ref) async {
  final repo = ref.read(authRepoProvider); 
  return await repo.fetchBrands();
}