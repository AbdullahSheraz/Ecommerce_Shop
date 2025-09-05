import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop/config/api_config.dart';
import 'package:shop/data/services/auth_local_storage_services.dart'; 
import 'package:shop/models/user_model.dart';

class AuthService {
  Future<Map<String, dynamic>> registerUser(Map<String, dynamic> body) async {
    final url = Uri.parse(userRegistor);

    final response = await http.post(
      url,
      headers: defaultHeaders,
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      print('RESPONSE BODY:${jsonEncode(body)}');
      print(' RESPONSE: ${response}');
      return jsonDecode(response.body);
    } else {
      throw Exception("Server error occured");
    }
  }

  Future<Map<String, dynamic>> loginUser(Map<String, dynamic> body) async {
    final url = Uri.parse(userLogin);

    final response = await http.post(
      url,
      headers: defaultHeaders,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print('RESPONSE:${response.body}');
      return jsonDecode(response.body);
    } else {
      print("✅ ${jsonEncode(body)}");
      throw Exception("Server error occured");
    }
  }

  Future<UserModel> fetchUserProfile() async {
    final userId = await AuthLocalStorage.getUserId();
    if (userId == null) {
      throw Exception("No userId found in local storage");
    }

    final url = Uri.parse("$getUserInfo/$userId");

    final response = await http.get(url, headers: defaultHeaders);

    if (response.statusCode == 200) {
      print("📥 Status 200 OK");
      print("📥 Raw Body: ${response.body}");

      final decoded = jsonDecode(response.body);

      final userJson = decoded['users'];

      if (userJson == null) {
        throw Exception("❌ API returned no user data under 'users'");
      }

      return UserModel.fromJson(userJson as Map<String, dynamic>);
    } else {
      print("❌ Error ${response.statusCode}: ${response.body}");
      throw Exception("Failed to load profile");
    }
  }

}
