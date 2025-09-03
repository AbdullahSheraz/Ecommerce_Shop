import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop/config/api_config.dart';

class AuthService {
  Future<Map<String, dynamic>> registerUser(Map<String, dynamic> body) async {
    final url = Uri.parse(userRegistor);

    final response = await http.post(
      url,
      headers: defaultHeaders,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Server error occured");
    }
  }
}
