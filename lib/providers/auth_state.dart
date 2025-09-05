import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthState, bool>((Ref ref) {
  return AuthState();
});

class AuthState extends StateNotifier<bool> {
  AuthState() : super(false);

  void login() => state = true;
  void logout() => state = false;
}
