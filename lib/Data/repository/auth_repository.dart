import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop/data/services/auth_services.dart'; 
import 'package:shop/models/user_model.dart';
part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepo(Ref ref) {
  return AuthRepository();
}

class AuthRepository {
  final AuthService authService = AuthService();

  Future<Map<String, dynamic>> registerUser(Map<String, dynamic> body) async {
    try {
      final result = await authService.registerUser(body);

      if (result["status"] == 422 && result["validator_errors"] != null) {
        final errors = result["validator_errors"];
        final firstError = (errors.values.first as List).first.toString();
        return {
          "success": false,
          "message": firstError,
        };
      }

      return result;
    } catch (e, _) {
      return {
        "success": false,
        "message": "Registration failed: $e",
      };
    }
  }

  Future<Map<String, dynamic>> loginUser(Map<String, dynamic> body) async {
    final result = await authService.loginUser(body);

    try {
      if (result["status"] == 401 && result["message"] != null) {
        final errors = result["message"];
        final firstError = (errors.values.first as List).first.toString();
        return {
          "success": false,
          "message": firstError,
        };
      }
      return result;
    } catch (e, _) {
      return {
        "success": false,
        "message": result["message"].toString(),
      };
    }
  }

  Future<UserModel> userInfo() async {
    try {
      final result = await authService.fetchUserProfile();
      return result;
    } catch (e, _) {
      throw Exception("userInfo failed: $e");
    }
  }

}
