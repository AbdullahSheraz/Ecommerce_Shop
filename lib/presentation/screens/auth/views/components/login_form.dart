import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/core/constants/constants.dart';

class LogInForm extends StatefulWidget {
  final TextEditingController emailC, passC;
  final GlobalKey<FormState> formKey;

  const LogInForm({
    super.key,
    required this.formKey,
    required this.emailC,
    required this.passC,
  });

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final Color baseGrey =
        Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: 0.15);

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
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
                borderSide: BorderSide(color: baseGrey, width: 1),
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
                borderSide: const BorderSide(
                  color: Colors.black26,
                ),
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
            controller: widget.passC,
            validator: passwordValidator.call,
            obscureText: obscurePassword,
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
                borderSide: BorderSide(color: baseGrey),
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
                borderSide: const BorderSide(
                  color: Colors.black26,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
