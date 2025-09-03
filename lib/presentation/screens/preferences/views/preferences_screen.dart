import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shop/main.dart';
import 'package:shop/providers/navigationbar_provider.dart';


class PreferencesScreen extends ConsumerWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ref.read(navigationProvider.notifier).setIndex(4);
            },
            icon: const Icon(LucideIcons.chevronLeft)),
        title: const Text("Cookie preferences"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Reset"),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                ref.read(themeProvider.notifier).state =
                    ref.read(themeProvider) == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark;
              },
              title: Text(
                "Theme Mode Dark",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: defaultPadding / 2),
                child: Text(
                  "Tap on button to apply Dark mode",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).textTheme.bodyMedium!.color),
                ),
              ),
              trailing: CupertinoSwitch(
                onChanged: (value) {
                  ref.read(themeProvider.notifier).state =
                      value ? ThemeMode.dark : ThemeMode.light;
                },
                activeColor: primaryColor,
                value: ref.watch(themeProvider) == ThemeMode.dark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
