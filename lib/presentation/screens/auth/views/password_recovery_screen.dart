import 'package:flutter/material.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/presentation/screens/auth/views/components/reset_form.dart';


class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 180),
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
                      child: Text("Forget Password  UI",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600)),
                    ),
                    // gapH8,
                    // const Text("Enter your email to reset your password.",
                    //     style: TextStyle(
                    //         fontSize: 13, fontWeight: FontWeight.w600)),
                    gapH32,
                    ResetForm(formKey: formKey),

                    gapH32,
                    InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          // context.pushNamed('dum');
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
                              "RESET PASSWORD",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    gapH20,
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Text(
                    //       "Don't have an account?",
                    //       style: TextStyle(
                    //           fontSize: 13, fontWeight: FontWeight.w400),
                    //     ),
                    //     gapW4,
                    //     InkWell(
                    //       onTap: () {
                    //         context.pushNamed(RoutesName.signUpScreenRoute);
                    //       },
                    //       child: const Text(
                    //         "Sign up",
                    //         style: TextStyle(
                    //             color: primaryColor,
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w400),
                    //       ),
                    //     )
                    //   ],
                    // ),
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
