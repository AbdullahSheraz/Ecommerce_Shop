 

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/providers/auth_providers.dart';
import 'package:shop/presentation/screens/auth/views/components/countrypicker.dart';
import 'package:shop/presentation/screens/auth/views/components/register_form.dart';
 import 'package:shop/core/constants/constants.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
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
      "phonecode":
          int.tryParse(ref.read(selectedCountryCallingCodeProvider) ?? "0"),
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

  if (result["message"] != null &&
    result["message"].toString().toLowerCase().contains("success")) {
   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        result["message"],  
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
 
    ),
  );
      context.goNamed('dum');
} else {
   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        result["message"] ?? "Failed to register",
        style: const TextStyle(color: Colors.white),
      ),
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
                    RegisterForm(
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
                              ? const SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
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
                            "Log In",
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
