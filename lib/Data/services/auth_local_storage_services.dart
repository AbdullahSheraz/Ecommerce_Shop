import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalStorage {
  static const tokenKey = "auth_token";
  static const loginDateKey = "login_date";
  static const userIdKey = "user_id";

  static Future<void> saveLogin(String token, String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
    await prefs.setString(userIdKey, userId);
    await prefs.setString(loginDateKey, DateTime.now().toIso8601String());
 
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }

  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(tokenKey);
    final loginDateStr = prefs.getString(loginDateKey);

    if (token == null || loginDateStr == null) return false;

    final loginDate = DateTime.tryParse(loginDateStr);
    if (loginDate == null) return false;

    final expiryDate = loginDate.add(const Duration(days: 15));
    final stillValid = DateTime.now().isBefore(expiryDate);

    if (!stillValid) {
      await logout();
    }

    return stillValid;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
    await prefs.remove(userIdKey);
    await prefs.remove(loginDateKey);
  }
}
