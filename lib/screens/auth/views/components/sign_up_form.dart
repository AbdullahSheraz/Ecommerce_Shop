import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/constants/app_sizes.dart';
import 'package:shop/constants/constants.dart';
import 'package:shop/screens/auth/views/components/countrypicker.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController emailC,
      userNameC,
      passC,
      mobileC,
      postalCodeC,
      addressC,
      nameC;
  const SignUpForm(
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
  Widget build(BuildContext context) {
    final Color baseGrey =
        Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: 0.15);

    return Form(
      key: formKey,
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
            controller: nameC,
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
              'UserName',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          gapH4,
          TextFormField(
            controller: userNameC,
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
              'Mobile no',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          gapH4,
          TextFormField(
            controller: mobileC,
            onSaved: (mobile) {},
            validator: mobileValidator.call,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              hintText: "03001234567",
              hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.3)),
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Call.svg",
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
              'Address',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          gapH4,
          TextFormField(
            controller: addressC,
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
            controller: postalCodeC,
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
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Email',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          gapH4,
          TextFormField(
            controller: emailC,
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
              'Password',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          gapH4,
          TextFormField(
            controller: passC,
            onSaved: (pass) {},
            validator: passwordValidator.call,
            obscureText: true,
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
          ),  gapH16,
          CountryStateCityDropdown()
        ],
      ),
    );
  }
}
