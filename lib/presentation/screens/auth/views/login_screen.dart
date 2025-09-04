import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/core/constants/route_constants.dart';
import 'package:shop/providers/auth_providers.dart';
import 'package:shop/data/services/auth_local_storage_services.dart';

import 'components/login_form.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  Future<void> authenticateUser(BuildContext context, WidgetRef ref) async {
    if (formKey.currentState!.validate()) {
      final body = {
        "email": emailC.text.trim(),
        "password": passC.text.trim(),
      };

      final auth = ref.read(authProvidersProvider.notifier);
      final result = await auth.loginUser(body);

      if (result["success"] == true ||
          result["message"] == "Login successful") {
        final userId = result["userid"].toString();
        final token = result["token"] ?? "";
        if (token.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No token returned from API")),
          );
          return;
        }

        await AuthLocalStorage.saveLogin(token, userId);

        print(AuthLocalStorage.tokenKey);
        print("✅ Login success, saved userId: $userId and token: $token");

        context.goNamed('dum');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result["message"])),
        );
      }
    }
  }

  String generateRandomToken(int length) {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final rand = Random();
    return List.generate(length, (index) => chars[rand.nextInt(chars.length)])
        .join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Image.asset(
                height: 110,
                width: 110,
                "assets/images/its.jpg",
                fit: BoxFit.fill,
              ),
              gapH10,
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text("LOGIN UI",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600)),
                    ),
                    gapH8,
                    const Text(
                        "Log in with your data that you intered during your registration.",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600)),
                    gapH32,
                    LogInForm(
                      formKey: formKey,
                      emailC: emailC,
                      passC: passC,
                    ),
                    gapH10,
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: const Text(
                          "Forgot password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black87),
                        ),
                        onTap: () {
                          context.pushNamed(
                              RoutesName.passwordRecoveryScreenRoute);
                        },
                      ),
                    ),
                    gapH64,
                    InkWell(
                      onTap: () async {
                        await authenticateUser(context, ref);
                      },
                      child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: primaryColor),
                          child: const Center(
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    gapH20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                        gapW4,
                        InkWell(
                          onTap: () {
                            context.pushNamed(RoutesName.signUpScreenRoute);
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
