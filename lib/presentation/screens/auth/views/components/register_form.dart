import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/presentation/screens/auth/views/components/countrypicker.dart';
import 'package:shop/providers/common_providers.dart';

final selectedCountryCodeProvider = StateProvider<String?>((ref) => null);

class RegisterForm extends ConsumerStatefulWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController emailC,
      userNameC,
      passC,
      mobileC,
      postalCodeC,
      addressC,
      nameC;
  const RegisterForm(
      {super.key,
      required this.nameC,
      required this.formKey,
      required this.emailC,
      required this.mobileC,
      required this.passC,
      required this.userNameC,
      required this.addressC,
      required this.postalCodeC});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    bool obscurePassword = true;
    final selectedCode = ref.watch(selectedCountryCodeProvider);
    final countryCodes = ref.watch(getCountriesCodeProvider);

    final Color baseGrey =
        Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: 0.15);

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Name',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          gapH4,
          TextFormField(
            controller: widget.nameC,
            onSaved: (name) {},
            validator: userValidator.call,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              hintText: "",
              hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.3)),
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Profile.svg",
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(baseGrey, BlendMode.srcIn),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: baseGrey, width: 1.2),
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          gapH16,
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Username',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          gapH4,
          TextFormField(
            controller: widget.userNameC,
            onSaved: (username) {},
            validator: usernameValidator.call,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              hintText: "abcd",
              hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.3)),
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Profile.svg",
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(baseGrey, BlendMode.srcIn),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: baseGrey, width: 1.2),
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          gapH16,
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Email',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          gapH4,
          TextFormField(
            controller: widget.emailC,
            onSaved: (email) {},
            validator: emaildValidator.call,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              hintText: "abc@gmail.com",
              hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.3)),
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Message.svg",
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(baseGrey, BlendMode.srcIn),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: baseGrey, width: 1.2),
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          gapH16,
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Mobile no',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          gapH4,
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: baseGrey, width: 1.2),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.22,
                  child: countryCodes.when(
                    data: (codes) {
                      return DropdownButtonFormField<String>(
                        value: selectedCode,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        iconSize: 18,
                        items: codes.map((c) {
                          return DropdownMenuItem(
                          
                            alignment: Alignment.center,
                            value: c['label'].toString(),
                            child: Text(
                              "${c['iso_code']} (${c['label']})",
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black87),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          ref.read(selectedCountryCodeProvider.notifier).state =
                              value;
                        },
                      );
                    },
                    loading: () => const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    error: (e, _) => const Text("Error"),
                  ),
                ),
                gapW8,
                Expanded(
                  child: TextFormField(
                    controller: widget.mobileC,
                    validator: mobileValidator.call,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: "3001234567",
                      hintStyle:
                          TextStyle(color: Colors.grey.withValues(alpha: 0.3)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          gapH16,
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Password',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          gapH4,
          TextFormField(
            controller: widget.passC,
            onSaved: (pass) {},
            validator: passwordValidator.call,
            obscureText: obscurePassword,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              hintText: "**********",
              hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.3)),
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Lock.svg",
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(baseGrey, BlendMode.srcIn),
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  // ignore: dead_code
                  obscurePassword ? LucideIcons.eye : LucideIcons.eyeOff,
                  color: Colors.grey.withValues(alpha: 0.5),
                  size: 23,
                ),
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: baseGrey, width: 1.2),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black26,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          gapH16,
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Address',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          gapH4,
          TextFormField(
            controller: widget.addressC,
            onSaved: (address) {},
            validator: addressValidator.call,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.streetAddress,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              hintText: "Gujranwala Punjab, Pakistan",
              hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.3)),
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Address.svg",
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(baseGrey, BlendMode.srcIn),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: baseGrey, width: 1.2),
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          gapH16,
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Postal Code',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          gapH4,
          TextFormField(
            controller: widget.postalCodeC,
            onSaved: (mobile) {},
            validator: postalCodeValidator.call,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              hintText: "000000",
              hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.3)),
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Address.svg",
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(baseGrey, BlendMode.srcIn),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: baseGrey, width: 1.2),
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          gapH16,
          CountryStateCityDropdown()
        ],
      ),
    );
  }
}
