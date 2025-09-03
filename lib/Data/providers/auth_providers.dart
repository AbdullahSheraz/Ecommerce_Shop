import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop/data/repository/auth_repository.dart';

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
}
