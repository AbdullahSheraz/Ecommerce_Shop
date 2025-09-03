import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop/data/services/auth_services.dart';
part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepo(ref) {
  return AuthRepository();
}

class AuthRepository {
  final AuthService authService = AuthService();

  Future<Map<String, dynamic>> registerUser(Map<String, dynamic> body) async {
    try {
      final result = await authService.registerUser(body);
      return result;
    } catch (e) {
      throw Exception("Error Occured");
    }
  }
}
