import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/constants/constants.dart';
import 'package:shop/constants/app_sizes.dart';
import 'package:shop/constants/route_constants.dart';

import 'components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    LogInForm(formKey: _formKey),
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
                          context
                              .goNamed(RoutesName.passwordRecoveryScreenRoute);
                        },
                      ),
                    ),
                    gapH64,
                    InkWell(
                      onTap: () {
                       if (_formKey.currentState!.validate()) {
                          context.pushNamed('dum');
                        }
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
