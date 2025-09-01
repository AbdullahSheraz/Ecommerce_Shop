import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/constants/app_sizes.dart';
import 'package:shop/screens/auth/views/components/sign_up_form.dart';
import 'package:shop/constants/route_constants.dart';

import 'package:shop/constants/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, bottom: 40),
          child: Column(
            children: [
              Image.asset(
                height: 110,
                width: 110,
                "assets/images/its.jpg",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text("Let’s get started!",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600)),
                    ),
                    gapH8,
                    const Text(
                        "Please enter your valid data in order and  create your  account.",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600)),
                    gapH32,
                    SignUpForm(formKey: _formKey),
                    gapH16,
                    Row(
                      children: [
                        Checkbox(
                          onChanged: (value) {},
                          value: false,
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: "I agree with the",
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.goNamed(RoutesName
                                          .termsOfServicesScreenRoute);
                                    },
                                  text: " Terms of service ",
                                  style: const TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const TextSpan(
                                  text: "& privacy policy.",
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    gapH32,
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // There is 2 more screens while user complete their profile
                    //     // afre sign up, it's available on the pro version get it now
                    //     // 🔗 https://theflutterway.gumroad.com/l/fluttershop
                    //     context.goNamed(RoutesName.entryPointScreenRoute);
                    //   },
                    //   child: const Text("Continue"),
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Text("Do you have an account?"),
                    //     TextButton(
                    //       onPressed: () {
                    //                                                                   context.goNamed(RoutesName.logInScreenRoute);

                    //       },
                    //       child: const Text("Log in"),
                    //     )
                    //   ],
                    // ),
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
                              "SIGNUP",
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
                          "Already have an account?",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                        gapW4,
                        InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: const Text(
                            "LogIn",
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
