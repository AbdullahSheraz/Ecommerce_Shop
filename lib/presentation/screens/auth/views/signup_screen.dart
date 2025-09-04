// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shop/constants/app_sizes.dart';
// import 'package:shop/screens/auth/views/components/sign_up_form.dart';
// import 'package:shop/constants/route_constants.dart';

// import 'package:shop/constants/constants.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailC = TextEditingController();
//   final TextEditingController userNameC = TextEditingController();
//   final TextEditingController mobileC = TextEditingController();
//   final TextEditingController passC = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 80, bottom: 40),
//           child: Column(
//             children: [
//               Image.asset(
//                 height: 110,
//                 width: 110,
//                 "assets/images/its.jpg",
//                 fit: BoxFit.cover,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(defaultPadding),
//                 child: Column(
//                   children: [
//                     const Align(
//                       alignment: Alignment.center,
//                       child: Text("Let’s get started!",
//                           style: TextStyle(
//                               fontSize: 28, fontWeight: FontWeight.w600)),
//                     ),
//                     gapH8,
//                     const Text(
//                         "Please enter your valid data in order and  create your  account.",
//                         style: TextStyle(
//                             fontSize: 13, fontWeight: FontWeight.w600)),
//                     gapH32,
//                     SignUpForm(
//                       formKey: _formKey,
//                       emailC: emailC,
//                       passC: passC,
//                       mobileC: mobileC,
//                       userNameC: userNameC,
//                     ),
//                     gapH16,
//                     Row(
//                       children: [
//                         Checkbox(
//                           onChanged: (value) {},
//                           value: false,
//                         ),
//                         Expanded(
//                           child: Text.rich(
//                             TextSpan(
//                               text: "I agree with the",
//                               children: [
//                                 TextSpan(
//                                   recognizer: TapGestureRecognizer()
//                                     ..onTap = () {
//                                       context.goNamed(RoutesName
//                                           .termsOfServicesScreenRoute);
//                                     },
//                                   text: " Terms of service ",
//                                   style: const TextStyle(
//                                     color: primaryColor,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 const TextSpan(
//                                   text: "& privacy policy.",
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     gapH32,
//                     InkWell(
//                       onTap: () {
//                         if (_formKey.currentState!.validate()) {
//                           context.pushNamed('dum');
//                         }
//                       },
//                       child: Container(
//                           width: double.infinity,
//                           padding: EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: primaryColor),
//                           child: const Center(
//                             child: Text(
//                               "SIGNUP",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           )),
//                     ),
//                     gapH20,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           "Already have an account?",
//                           style: TextStyle(
//                               fontSize: 13, fontWeight: FontWeight.w400),
//                         ),
//                         gapW4,
//                         InkWell(
//                           onTap: () {
//                             context.pop();
//                           },
//                           child: const Text(
//                             "LogIn",
//                             style: TextStyle(
//                                 color: primaryColor,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400),
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/providers/auth_providers.dart';
import 'package:shop/presentation/screens/auth/views/components/countrypicker.dart';
import 'package:shop/presentation/screens/auth/views/components/sign_up_form.dart';
import 'package:shop/core/constants/route_constants.dart';
import 'package:shop/core/constants/constants.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController userNameC = TextEditingController();
  final TextEditingController mobileC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  final TextEditingController postalCodeC = TextEditingController();
  final TextEditingController addressC = TextEditingController();
  final TextEditingController nameC = TextEditingController();
  bool isLoading = false;
  Future<void> registerUser() async {
    setState(() => isLoading = true);

    final body = {
      "name": nameC.text.trim(),
      "username": userNameC.text.trim(),
      "email": emailC.text.trim(),
      "password": passC.text.trim(),
      "roleid": 1,
      "phone": mobileC.text.trim(),
      "phonecode": int.tryParse(ref.read(selectedCountryCallingCodeProvider) ?? "0"),
      "country_id": int.tryParse(ref.read(selectedCountryProvider) ?? "0"),
      "state_id": int.tryParse(ref.read(selectedStateProvider) ?? "0"),
      "city_id": int.tryParse(ref.read(selectedCityProvider) ?? "0"),
      "address": addressC.text.trim(),
      "postalcode": postalCodeC.text.trim(),
    };

    final result =
        await ref.read(authProvidersProvider.notifier).registerUser(body);
    print("📩 Register response: $result");

    setState(() => isLoading = false);

    if (result["success"] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registered Successfully")),
      );
      context.pushNamed(RoutesName.logInScreenRoute);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result["message"] ?? "Registration failed"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

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
                        "Please enter your valid data in order and create your account.",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600)),
                    gapH32,
                    SignUpForm(
                      formKey: _formKey,
                      emailC: emailC,
                      passC: passC,
                      mobileC: mobileC,
                      userNameC: userNameC,
                      addressC: addressC,
                      postalCodeC: postalCodeC,
                      nameC: nameC,
                    ),
                    gapH32,
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          registerUser();
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: primaryColor,
                        ),
                        child: Center(
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "SIGNUP",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                        ),
                      ),
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
